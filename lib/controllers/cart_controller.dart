import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';

import '../core/classes/crud.dart';
import '../core/functions/handling_data.dart';
import '../enums/status_request.dart';
import '../main.dart';
import '../models/cart_model.dart';
import '../remote/cart_data.dart';

class CartController extends GetxController {
  int selectedPayment = 0;
  int selectedQuantity = 0;
  bool isEditable = true;

  StatusRequest? statusrequest;
  Crud crud = Crud();
  late CartData cartdata = CartData(crud);

  double getTotal() {
    double total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total = total + cartList[i].quantity * cartList[i].product.price;
    }
    return total;
  }

  void toggleEditing() {
    isEditable = false;
    update(["infos"]);
  }

  void changeSelectedPayment(int index) {
    selectedPayment = index;
    update(["payment"]);
  }

  checkout(context, String sa, String phone, String status) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.postData(sa, phone, status);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.succes) {
      update();
      Get.toNamed("/successcheckout");
      cartList.clear();
    } else if (statusrequest == StatusRequest.failure) {
      update();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Erreur',
        desc: "Un des produits n'est plus en stock!",
        btnCancelOnPress: () {},
      ).show();
    }
  }

  paypalCheckout(context, String sa, String phone, String status) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await cartdata.postData(sa, phone, status);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.succes) {
      update();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context2) => UsePaypal(
            sandboxMode: true,
            clientId:
                "AasBn5NpYxcYslyF9X4wmGonY7cshw2F-O27Uq150H7r7dLoIxcpdWcmvFMB0w483fBvR_IO17vc5Lkg",
            secretKey:
                "EHvPOy6WXChYidiEf-49CwFhGZ11zR8-lat8F7iKjc-xmj38LH590gpQwfoTHLnS-Sah-7ZDnCeEl32J",
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [
              {
                "amount": {
                  "total": getTotal().toString(),
                  "currency": "USD",
                  "details": {
                    "subtotal": getTotal().toString(),
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                // "payment_options": {
                //   "allowed_payment_method":
                //       "INSTANT_FUNDING_SOURCE"
                // },
                "item_list": {
                  "items": [
                    for (int i = 0; i < cartList.length; i++)
                      {
                        "name": cartList[i].product.name,
                        "quantity": cartList[i].quantity.toString(),
                        "price": cartList[i].product.price.toString(),
                        "currency": "USD"
                      },
                  ],
                  "shipping_address": {
                    "recipient_name": prefs.getString("username"),
                    "line1": sa,
                    "line2": "",
                    "city": "A",
                    "country_code": "US",
                    "postal_code": "73301",
                    "phone": "+00000000",
                    "state": "A"
                  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              checkout(context, sa, phone, "payed");
            },
            onError: (error) {},
            onCancel: (params) {},
          ),
        ),
      );
    } else if (statusrequest == StatusRequest.failure) {
      update();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Erreur',
        desc: "Un des produits n'est plus en stock!",
        btnCancelOnPress: () {},
      ).show();
    }
  }
}
