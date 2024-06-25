import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../../models/cart_model.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black.withOpacity(.6),
              size: 18,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: "Kanit",
                    color: Colors.black.withOpacity(.7),
                    fontWeight: FontWeight.w600),
              ),
              GetBuilder<ProductPageController>(builder: (controller) {
                return Text(
                  "${cartList.length} articles",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kanit",
                      color: Colors.black.withOpacity(.4),
                      fontWeight: FontWeight.w600),
                );
              })
            ],
          ),
          const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
