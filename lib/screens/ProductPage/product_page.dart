import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/product_page_controller.dart';
import '../../enums/status_request.dart';
import '../../models/products_model.dart';
import 'wdgets/product_details.dart';
import 'wdgets/product_images.dart';
import 'wdgets/product_page_header.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final args =
        ModalRoute.of(context)!.settings.arguments as ProductPageArguments;
    ProductsModel products = args.pList;
    String tag = args.tag;
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F8),
      body: SafeArea(
          child: GetBuilder<ProductPageController>(id: "allpage",builder: (controller) {
        return controller.statusrequest == StatusRequest.loading
            ? SizedBox(
                height: height - 30,
                child: Center(
                  child: Lottie.asset("assets/lottie/loading.json",
                      width: 150, height: 150),
                ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ProductPageHeader(
                      rating: products.rating,
                    ),
                    ProductImage(image: products.image, id: tag),
                    const SizedBox(height: 25),
                    ProductDetails(
                      products: products,
                    ),
                  ],
                ),
              );
      })),
    );
  }
}

class ProductPageArguments {
  final ProductsModel pList;
  final String tag;
  ProductPageArguments(this.pList, this.tag);
}
