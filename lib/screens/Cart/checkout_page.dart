import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/screens/Cart/widgets/checkout_body.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import '../../enums/status_request.dart';
import '../../models/cart_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/your_adresse_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPageController productpagecontroller =
        Get.find<ProductPageController>();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: const CustomAppBar(
            title: "Validation",
          )),
      body: SafeArea(
        child: GetBuilder<ProductPageController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.statusrequest == StatusRequest.loading
                  ? SizedBox(
                      height: height - 250,
                      child: Center(
                        child: Lottie.asset("assets/lottie/loading.json",
                            width: 150, height: 150),
                      ))
                  : const CheckoutBody(),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        btnText: "Valider",
        onpressed: () async {
          if (infoskey.currentState!.validate()) {
            if (cartList.isNotEmpty &&
                productpagecontroller.statusrequest != StatusRequest.loading) {
              if (productpagecontroller.selectedPayment == 1) {
                productpagecontroller.checkout(
                    context, adressecntrl.text, phonecntrl.text);
              } else if (productpagecontroller.selectedPayment == 3) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => UsePaypal(
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
                              "total":
                                  productpagecontroller.getTotal().toString(),
                              "currency": "USD",
                              "details":  {
                                "subtotal": productpagecontroller.getTotal().toString(),
                                "shipping": '0',
                                "shipping_discount": 0
                              }
                            },
                            "description":
                                "The payment transaction description.",
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

                              // shipping address is not required though
                            }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          print("==============================================================onSuccess: $params");
                        },
                        onError: (error) {
                          print("==============================================================onError: $error");
                        },
                        onCancel: (params) {
                          print('==============================================================cancelled: $params');
                        }),
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
}
