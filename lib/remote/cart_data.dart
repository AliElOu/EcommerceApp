import 'dart:convert';

import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

import '../main.dart';
import '../models/cart_model.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  postData(String sa,String phone,String status) async {
    var payload = {
      'cart': cartList.map((item) => item.toJson()).toList(),
      'user_id': prefs.getString("id"),
      'shipping_address' : sa,
      'phone' : phone,
      'status' : status,
    };
    var jsonData = json.encode(payload);

    var response = await crud.postData2(AppLinks.checkout, jsonData);
    return response.fold((l) => l, (r) => r);
  }
}
