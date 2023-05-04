// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import 'widgets/cart_products.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              ?  SizedBox(
                height: height - 250,
                child: const Center(
                  child: Text(
                    "No items ! ",
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
              )
              : const cartProductsList(),
        );
      })),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
