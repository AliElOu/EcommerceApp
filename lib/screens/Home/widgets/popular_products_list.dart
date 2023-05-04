import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/products_model.dart';
import '../../ProductPage/product_page.dart';

class ProductsList extends StatelessWidget {
  final ProductsModel Products;
  const ProductsList({
    required this.Products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "product",
                arguments: ProductPageArguments(Products));
          },
          child: Container(
            height: 140,
            width: 140,
            margin: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffEDEEF1),
            ),
            padding: const EdgeInsets.only(right: 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Hero(
                  tag: Products.id, child: Image.network(Products.images[0])),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 32,
                  child: Text(
                    Products.name,
                    style: const TextStyle(
                        fontFamily: "ubuntu", fontSize: 13, height: 1.3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${Products.price}",
                      style: TextStyle(
                          fontFamily: "ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.orange.shade700),
                    ),
                    GetBuilder<ProductPageController>(builder: (controller) {
                      return Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: Products.isFavorit
                              ? const Color.fromARGB(38, 158, 87, 28)
                              : const Color.fromARGB(31, 158, 158, 158),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onPressed: () {
                            controller.toggleFavorite(Products);
                          },
                          icon: Products.isFavorit
                              ? SvgPicture.network(
                                  "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Heart%20Icon_2.svg",
                                  color: Colors.red)
                              : SvgPicture.network(
                                  "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Heart%20Icon_2.svg"),
                          color: Colors.grey,
                        ),
                      );
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
