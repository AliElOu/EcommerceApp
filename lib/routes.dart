import 'package:flutter_bootcamp/middlewares/auth_middleware.dart';
import 'package:flutter_bootcamp/middlewares/onboarding_middleware.dart';
import 'package:flutter_bootcamp/screens/Auth/forgetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/resetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/verify_account_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/verify_reset_password_screen.dart';
import 'package:flutter_bootcamp/screens/Cart/cart_page.dart';
import 'package:flutter_bootcamp/screens/Cart/checkout_page.dart';
import 'package:flutter_bootcamp/screens/Cart/succes_checkout_screen.dart';
import 'package:flutter_bootcamp/screens/Category/category_products_list.dart';
import 'package:flutter_bootcamp/screens/Home/home_screen.dart';
import 'package:flutter_bootcamp/screens/NewProducts/new_products_screen.dart';
import 'package:flutter_bootcamp/screens/Profile/change_password_screen.dart';
import 'package:flutter_bootcamp/screens/Profile/orders_history_products_screen.dart';
import 'package:flutter_bootcamp/screens/Profile/orders_history_screen.dart';
import 'package:flutter_bootcamp/screens/Profile/profile_screen.dart';
import 'package:flutter_bootcamp/screens/favorits/favorits_screen.dart';
import 'package:get/get.dart';
import 'screens/Auth/signin_screen.dart';
import 'screens/Auth/signup_screen.dart';
import 'screens/Onboarding/Onboarding_Screen.dart';
import 'screens/PopProducts/pop_products_screen.dart';
import 'screens/ProductPage/product_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  "onboarding": (context) => const Onboardingscreen(),
  "login": (context) => const SigninScreen(),
  "register": (context) => const SignupScreen(),
  "forgetpassword": (context) => const ForgetPasswordPage(),
  "verifyaccount": (context) => const VerifyAccountScreen(),
  "verifyresetpassword": (context) => const VerifyResetPasswordScreen(),
  "resetpassword": (context) => const ResetPasswordPage(),
  "home": (context) => const Homepage(),
  "product": (context) => const ProductPage(),
  "cart": (context) => const CartPage(),
  "checkout": (context) => const CheckoutPage(),
  "favorits": (context) => const FavoritsScreen(),
  "newproducts": (context) => const NewProductsScreen(),
  "popproducts": (context) => const PopProductsScreen(),
  "category": (context) => const CategorieProductsList(),
  "profile": (context) => const ProfilePage(),
  "changepass": (context) => const ChangePasswordPage(),
  "history": (context) => const OrdersHistoryScreen(),
  "historyproducts": (context) => const OrdersHistoryProductsScreen(),
  "successcheckout": (context) => const SuccessCheckoutScreen(),
};

final List<GetPage<dynamic>> routess = [
  GetPage(
      name: "/onboarding",
      page: (() => const Onboardingscreen()),
      middlewares: [OnboardingMiddleWare()]),
  GetPage(
      name: "/login",
      page: (() => const SigninScreen()),
      middlewares: [AuthMiddleWare()]),
  GetPage(name: "/register", page: (() => const SignupScreen())),
  GetPage(name: "/forgetpassword", page: (() => const ForgetPasswordPage())),
  GetPage(name: "/verifyaccount", page: (() => const VerifyAccountScreen())),
  GetPage(
      name: "/verifyresetpassword",
      page: (() => const VerifyResetPasswordScreen())),
  GetPage(name: "/resetpassword", page: (() => const ResetPasswordPage())),
  GetPage(name: "/home", page: (() => const Homepage())),
  GetPage(name: "/product", page: (() => const ProductPage())),
  GetPage(name: "/cart", page: (() => const CartPage())),
  GetPage(name: "/checkout", page: (() => const CheckoutPage())),
  GetPage(name: "/favorits", page: (() => const FavoritsScreen())),
  GetPage(name: "/newproducts", page: (() => const NewProductsScreen())),
  GetPage(name: "/popproducts", page: (() => const PopProductsScreen())),
  GetPage(name: "/category", page: (() => const CategorieProductsList())),
  GetPage(name: "/profile", page: (() => const ProfilePage())),
  GetPage(name: "/changepass", page: (() => const ChangePasswordPage())),
  GetPage(name: "/history", page: (() => const OrdersHistoryScreen())),
  GetPage(
      name: "/historyproducts",
      page: (() => const OrdersHistoryProductsScreen())),
  GetPage(
      name: "/successcheckout", page: (() => const SuccessCheckoutScreen())),
];
