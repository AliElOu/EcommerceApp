import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/remote/home_data.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../core/functions/handling_data.dart';
import '../main.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';

class HomeController extends GetxController {
  Crud crud = Crud();
  late HomeData homeData = HomeData(crud);

  List<CategoriesModel> listCategories = [];
  List<ProductsModel> listNewProducts = [];
  List<ProductsModel> listPopProducts = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData(prefs.getString("id")!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.succes) {
      for (Map item in response['data']['cat']) {
        listCategories.add(CategoriesModel.fromJson(item));
      }
      for (Map item in response['data']['newProd']) {
        listNewProducts.add(ProductsModel.fromJson(item));
      }
      for (Map item in response['data']['popProd']) {
        listPopProducts.add(ProductsModel.fromJson(item));
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> handleRefresh(RefreshController rc) async {
    listCategories.clear();
    listNewProducts.clear();
    listPopProducts.clear();
    update();
    getData();

    rc.refreshCompleted();
  }
}
