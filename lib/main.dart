import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/screens/Cart/cart_page.dart';
import 'package:flutter_bootcamp/screens/Home/home_screen.dart';
import 'package:flutter_bootcamp/screens/Home/home_test.dart';
import 'package:get/get.dart';
import 'screens/Auth/signin_screen.dart';
import 'screens/Auth/signup_screen.dart';
import 'screens/Onboarding/Onboarding_Screen.dart';
import 'screens/ProductPage/product_page.dart';

void main() {
  Get.lazyPut(() => ProductPageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: "home",
      routes: {
           "onboarding": (context) => const Onboardingscreen(),
           "login": (context) => const SigninScreen(),
           "register": (context) => const SignupScreen(),
           "home": (context) => const Homepage(),
           "product": (context) => const ProductPage(),
           "cart": (context) => const CartPage(),
      },
    );
  }
}
