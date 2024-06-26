import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

import '../../../models/products_model.dart';

class expandedTextWidget extends StatelessWidget {
  const expandedTextWidget({
    super.key,
    required this.products,
  });

  final ProductsModel products;

  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();

    if (products.description.length >= 300) {
      productController.isExpandable = true;
    } else {
      productController.isExpandable = false;
    }
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(right: 63),
      child: GetBuilder<ProductPageController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productController.isExpandable
                ? Text(
                    controller.isExpanded
                        ? products.description
                        : "${products.description.substring(0, 300)} ...",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "os",
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    products.description,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: "os",
                        fontWeight: FontWeight.bold),
                  ),
            const SizedBox(height: 8),
            if (productController.isExpandable)
              GestureDetector(
                onTap: () {
                  productController.toggleTextExpandation();
                },
                child: Text(
                  "Voir ${productController.isExpanded ? "moins de Details <" : "plus de Details >"}",
                  style: const TextStyle(
                      color: AppColors.PrimaryColor,
                      fontSize: 14,
                      fontFamily: "os",
                      fontWeight: FontWeight.bold),
                ),
              ),
          ],
        );
      }),
    );
  }
}
