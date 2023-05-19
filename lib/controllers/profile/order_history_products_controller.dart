import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../core/functions/handling_data.dart';
import '../../models/products_model.dart';
import '../../remote/Profile/orders_history_products_data.dart';


class OrderHistoryProductsController extends GetxController {
  Crud crud = Crud();

  late OrdersHistroyProductsData ordershistroyproductsdata = OrdersHistroyProductsData(crud);
  List<ProductsModel> productsList = [];

  StatusRequest? statusrequest;
  late double total =0;
  

  getData(String orderId) async {
    statusrequest = StatusRequest.loading;
    var response = await ordershistroyproductsdata.postData(orderId);
    statusrequest = handlingData(response);
    update();
    if (statusrequest == StatusRequest.succes) {
      productsList.clear();
      for (Map item in response['data']) {
        productsList.add(ProductsModel.fromJson2(item));
      }
      total = 0;
      for(int i = 0 ; i < productsList.length ; i++){
        total += productsList[i].quantity * productsList[i].price ;
      }
      update();
    }

  }


  Future<void> handleRefresh(RefreshController rc,String orderId) async {
    productsList.clear();

    update();
    getData(orderId);

    rc.refreshCompleted();
  }
}
