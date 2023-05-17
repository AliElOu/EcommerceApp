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
