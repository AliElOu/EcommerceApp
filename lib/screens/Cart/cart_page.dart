
import 'package:flutter/material.dart';

import 'widgets/cart_products.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const CustomAppBar()
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: cartProductsList(),
        )
      ),
    bottomNavigationBar: CustomNavBar(),
    );
  }
}

