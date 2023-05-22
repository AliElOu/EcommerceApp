import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

import '../../../enums/status_request.dart';
import '../../../models/cart_model.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Totale:",
                style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 16,
                    height: 1.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.4)),
              ),
              GetBuilder<ProductPageController>(builder: (controller) {
                double total = 0;
                for (int i = 0; i < cartList.length; i++) {
                  total =
                      total + cartList[i].quantity * cartList[i].product.price;
                }
                return Text(
                  "${total.toStringAsFixed(2).toString()}Dh",
                  style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                );
              })
            ],
          ),
          GetBuilder<ProductPageController>(
            builder: (controller) {
              return TextButton(
                style: cartList.isEmpty || controller.statusrequest == StatusRequest.loading
                    ? TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: const Color.fromARGB(255, 216, 208, 208),
                        backgroundColor: const Color.fromARGB(255, 49, 117, 57))
                    : TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff52C560)),
                child: const Text(
                  "Commander",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if(cartList.isNotEmpty && controller.statusrequest != StatusRequest.loading){
                    controller.checkout(context);
                  }
                },
              );
            }
          ),
        ],
      ),
    );
  }
}
