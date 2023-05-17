import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

import '../../main.dart';

class OrdersHistroyData {

  Crud crud ;
  OrdersHistroyData(this.crud);

  postData() async{
    var response = await crud.postData(AppLinks.ordersHistory, {
      "userid" : prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}