import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../main.dart';

class OrdersHistroyData {
  SettingServices c = Get.find();

  Crud crud ;
  OrdersHistroyData(this.crud);

  postData() async{
    var response = await crud.postData(AppLinks.ordersHistory, {
      "userid" : c.prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }

  dropData(String orderId) async{
    var response = await crud.postData(AppLinks.cancelOrder, {
      "orderId" : orderId
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}