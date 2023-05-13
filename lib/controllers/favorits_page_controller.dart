import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../core/functions/handling_data.dart';
import '../models/products_model.dart';
import '../remote/favorits_data.dart';

class FavoritsListController extends GetxController {
  FavoritsListController({required this.userid});
  Crud crud = Crud();
  late FavoritsData favoritsdata = FavoritsData(crud);

  List<ProductsModel> favoritsList = [];

  late StatusRequest statusrequest;
  late String userid;

  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await favoritsdata.postData(userid);
    statusrequest = handlingData(response);
    update();
    if (statusrequest == StatusRequest.succes) {
      for (Map item in response['data']) {
        favoritsList.add(ProductsModel.fromJson(item));
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
    favoritsList.clear();

    update();
    getData();

    rc.refreshCompleted();
  }
}
