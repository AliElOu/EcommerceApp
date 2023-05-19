import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/product_page_controller.dart';
import '../../../models/products_model.dart';
import 'expanded_text.dart';
import 'product_customisation.dart';

class ProductDetails extends StatelessWidget {
  final ProductsModel products;
  const ProductDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 0, 20),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.name,
                        style: const TextStyle(
                            fontSize: 19,
                            fontFamily: "os",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${products.price}Dh",
                        style: const TextStyle(
                            fontSize: 22,
                            fontFamily: "os",
                            color:Color(0xff52C560) ,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    productController.toggleFavorite(products,context,false);
                  },
                  child:
                      GetBuilder<ProductPageController>(builder: (controller) {
                    return Container(
                      width: double.maxFinite,
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 42,
                        width: 55,
                        decoration: BoxDecoration(
                            color: products.isFavorit
                                ? const Color(0xffF7DFDE)
                                : const Color(0xffF4F4F8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            )),
                        child: SvgPicture.network(
                            "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Heart%20Icon_2.svg",
                            color: products.isFavorit
                                ? Colors.red
                                : const Color(0xffDBDEE4)),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 15),
                expandedTextWidget(products: products),
              ],
            ),
          ),
          const SizedBox(height: 9),
          ProductCustomisation(products: products),
        ],
      ),
    );
  }
}
