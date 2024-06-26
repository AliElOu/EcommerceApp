import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:get/get.dart';

import '../../../controllers/product_page_controller.dart';
import '../../../models/cart_model.dart';
import '../../../models/products_model.dart';

class AddToCart extends StatelessWidget {
  final ProductsModel products;
  const AddToCart({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    bool isAlready = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].product.id == products.id) {
        isAlready = true;
      }
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 22),
      width: double.maxFinite,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: GetBuilder<ProductPageController>(builder: (controller) {
        return TextButton(
          style: (isAlready || controller.selectedQuantity == 0)
              ? TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: const Color.fromARGB(255, 216, 208, 208),
                  backgroundColor: AppColors.PrimaryColorBold,
                )
              : TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.PrimaryColor),
          child: const Text("Ajouter au panier"),
          onPressed: () {
            controller.addToCart(products, isAlready, context);
          },
        );
      }),
    );
  }
}
