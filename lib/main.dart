import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/screens/Auth/forgetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/resetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Cart/cart_page.dart';
import 'package:flutter_bootcamp/screens/Home/home_screen.dart';
import 'package:get/get.dart';
import 'controllers/signin_controller.dart';
import 'screens/Auth/otpverification_screen.dart';
import 'screens/Auth/signin_screen.dart';
import 'screens/Auth/signup_screen.dart';
import 'screens/Onboarding/Onboarding_Screen.dart';
import 'screens/ProductPage/product_page.dart';

void main() {
  Get.lazyPut(() => ProductPageController());
  Get.lazyPut(() => SignInController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "onboarding",
      routes: {
           "onboarding": (context) => const Onboardingscreen(),
           "login": (context) => const SigninScreen(),
           "register": (context) => const SignupScreen(),
           "forgetpassword": (context) => const ForgetPasswordPage(),
           "otpverification": (context) => const OtpVerificationPage(),
           "resetpassword": (context) => const ResetPasswordPage(),
           "home": (context) => const Homepage(),
           "product": (context) => const ProductPage(),
           "cart": (context) => const CartPage(),
      },
    );
  }
}
