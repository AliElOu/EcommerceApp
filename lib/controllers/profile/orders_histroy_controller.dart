import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../core/functions/handling_data.dart';
import '../../models/order_model.dart';
import '../../remote/Profile/orders_history_data.dart';

class OrdersHistoryController extends GetxController {
  Crud crud = Crud();

  late OrdersHistroyData ordershistroydata = OrdersHistroyData(crud);
  List<OrderModel> ordersList = [];

  late StatusRequest statusrequest;
  StatusRequest? statusrequest2;

  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await ordershistroydata.postData();
    statusrequest = handlingData(response);
    update();
    if (statusrequest == StatusRequest.succes) {
      ordersList.clear();
      for (Map item in response['data']) {
        ordersList.add(OrderModel.fromJson(item));
      }
      update();
    }
  }

  dropOrder(String orderId, context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Alerte',
      desc: 'êtes-vous sûre d\'annuler cette commande ?',
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      btnOkText: "Yes",
      btnCancelText: "No",
      btnOkOnPress: () async {
        statusrequest2 = StatusRequest.loading;
        var response = await ordershistroydata.dropData(orderId);
        statusrequest2 = handlingData(response);
        print(statusrequest2);
        if (statusrequest2 == StatusRequest.succes) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Succes',
            desc: 'La commande est annulé avec succes',
            btnOkOnPress: () =>
                Navigator.pushReplacementNamed(context, "history"),
          ).show();
        } else if (statusrequest2 == StatusRequest.failure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Erreur',
            desc: 'Vous ne pouvez pas annuler cette commande',
            btnCancelOnPress: () {
              Navigator.pushReplacementNamed(context, "history");
            },
          ).show();
        }
      },
    ).show();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> handleRefresh(RefreshController rc) async {
    ordersList.clear();

    update();
    getData();

    rc.refreshCompleted();
  }
}
