
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../enums/status_request.dart';
import '../../models/cart_model.dart';
import 'widgets/cart_products.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/empty_cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: const CustomAppBar()),
      body: SafeArea(
          child: GetBuilder<ProductPageController>(builder: (controller) {
        return SingleChildScrollView(
          child: cartList.isEmpty
              ?  const EmptyCartWidget()
              : controller.statusrequest == StatusRequest.loading
            ? SizedBox(
                height: height - 250,
                child: Center(
                  child: Lottie.asset("assets/lottie/loading.json",
                      width: 150, height: 150),
                ))
            : const CartProductsList(),
        );
      })),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}


