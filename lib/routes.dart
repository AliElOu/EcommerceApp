import 'package:flutter_bootcamp/Views/Chat/chat.dart';
import 'package:flutter_bootcamp/core/middlewares/auth_middleware.dart';
import 'package:flutter_bootcamp/core/middlewares/choose_language_middleware.dart';
import 'package:flutter_bootcamp/core/middlewares/onboarding_middleware.dart';
import 'package:flutter_bootcamp/views/Auth/forgetpassword_screen.dart';
import 'package:flutter_bootcamp/views/Auth/resetpassword_screen.dart';
import 'package:flutter_bootcamp/views/Auth/verify_account_screen.dart';
import 'package:flutter_bootcamp/views/Auth/verify_reset_password_screen.dart';
import 'package:flutter_bootcamp/views/Cart/cart_page.dart';
import 'package:flutter_bootcamp/views/Cart/checkout_page.dart';
import 'package:flutter_bootcamp/views/Cart/succes_checkout_screen.dart';
import 'package:flutter_bootcamp/views/Category/category_products_list.dart';
import 'package:flutter_bootcamp/views/Home/home_screen.dart';
import 'package:flutter_bootcamp/views/NewProducts/new_products_screen.dart';
import 'package:flutter_bootcamp/views/Onboarding/choose_language.dart';
import 'package:flutter_bootcamp/views/Profile/change_password_screen.dart';
import 'package:flutter_bootcamp/views/Profile/orders_history_products_screen.dart';
import 'package:flutter_bootcamp/views/Profile/orders_history_screen.dart';
import 'package:flutter_bootcamp/views/Profile/profile_screen.dart';
import 'package:flutter_bootcamp/views/favorits/favorits_screen.dart';
import 'package:get/get.dart';
import 'views/Auth/signin_screen.dart';
import 'views/Auth/signup_screen.dart';
import 'views/Onboarding/Onboarding_Screen.dart';
import 'views/PopProducts/pop_products_screen.dart';
import 'views/ProductPage/product_page.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(
      name: "/onboarding",
      page: (() => const Onboardingscreen()),
      middlewares: [OnboardingMiddleWare()]),
  GetPage(
      name: "/languages",
      page: (() => const ChooseLanguage()),
      middlewares: [ChooseLanguageMiddleWare()]),
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
  GetPage(name: "/chat", page: (() => const Chat())),
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
