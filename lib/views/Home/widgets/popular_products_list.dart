import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/home_controller.dart';
import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/products_model.dart';
import '../../ProductPage/product_page.dart';

class ProductsList extends StatelessWidget {
  final ProductsModel products;
  final String tag;
  final double height;
  final double width;

  const ProductsList({
    required this.products,
    required this.tag,
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String mytag = "${products.id}$tag";
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed("/product",
                arguments: ProductPageArguments(products, mytag));
          },
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffEDEEF1),
            ),
            padding: const EdgeInsets.only(right: 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Hero(
                  tag: mytag,
                  child: Image.network("${AppLinks.images}${products.image}")),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: Text(
                    products.name,
                    style: const TextStyle(
                        fontFamily: "ubuntu", fontSize: 13, height: 1.3),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${products.price} DH",
                      style: const TextStyle(
                          fontFamily: "ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: AppColors.PrimaryColor),
                    ),
                    GetBuilder<HomeController>(
                        id: "fav",
                        builder: (controller) {
                          return Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: products.isFavorit
                                  ? const Color.fromARGB(38, 158, 87, 28)
                                  : const Color.fromARGB(31, 158, 158, 158),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ((controller.statusRequest3 ==
                                        StatusRequest.loading) &&
                                    controller.clickedProduct ==
                                        products.id.toString())
                                ? const Padding(
                                    padding: EdgeInsets.all(9),
                                    child: CircularProgressIndicator(),
                                  )
                                : IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onPressed: () {
                                      controller.toggleFavorite(
                                          products, context);
                                    },
                                    icon: products.isFavorit
                                        ? SvgPicture.asset(
                                            "assets/icons/heartIcon2.svg",
                                            width: 100,
                                            height: 100,
                                            color: Colors.red)
                                        : SvgPicture.asset(
                                            "assets/icons/heartIcon2.svg",
                                            width: 100,
                                            height: 100,
                                          ),
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
