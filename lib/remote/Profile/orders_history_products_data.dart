import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';


class OrdersHistroyProductsData {

  Crud crud ;
  OrdersHistroyProductsData(this.crud);

  postData(String orderId) async{
    var response = await crud.postData(AppLinks.ordersHistoryProducts, {
      "orderId" : orderId,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}