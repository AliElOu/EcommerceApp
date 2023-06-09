import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../core/functions/handling_data.dart';
import '../models/products_model.dart';
import '../remote/category_products_data.dart';

class CategoryProductsController extends GetxController {
  Crud crud = Crud();
  late CategoryProductsData categoryProductsData = CategoryProductsData(crud);

  List<ProductsModel> listCatProducts = [];

  StatusRequest? statusrequest;

  getData(String catid) async {
    statusrequest = StatusRequest.loading;
    var response = await categoryProductsData.postData(catid);
    statusrequest = handlingData(response);
    update();
    if (statusrequest == StatusRequest.succes) {
      for (Map item in response['data']) {
        listCatProducts.add(ProductsModel.fromJson(item));
      }
      update();
    }
  }

  Future<void> handleRefresh(RefreshController rc, String catid) async {
    listCatProducts.clear();

    update();
    getData(catid);

    rc.refreshCompleted();
  }
}
