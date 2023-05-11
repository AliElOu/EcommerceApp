import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/cart_model.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();
    return Column(
      children: List.generate(
        cartList.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Dismissible(
            key: Key(cartList[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              if (index <= cartList.length) {
                productController.removeFromCart(cartList[index]);
              }
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.network(
                      "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: Container(
              height: 120,
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffEDEEF1),
                    ),
                    child: Image.network(cartList[index].product.image),
                  ),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: Text(
                          cartList[index].product.name,
                          style: const TextStyle(
                              fontFamily: "ubuntu", fontSize: 15, height: 1.3),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${cartList[index].product.price}",
                            style: const TextStyle(
                                fontFamily: "ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xff52C560)),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "x${cartList[index].quantity.toString()}",
                            style: const TextStyle(
                              fontFamily: "ubuntu",
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
