import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/home_controller.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/screens/Auth/forgetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/resetpassword_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/verify_account_screen.dart';
import 'package:flutter_bootcamp/screens/Auth/verify_reset_password_screen.dart';
import 'package:flutter_bootcamp/screens/Cart/cart_page.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/category_products_controller.dart';
import 'controllers/Auth/signin_controller.dart';
import 'screens/Auth/signin_screen.dart';
import 'screens/Auth/signup_screen.dart';
import 'screens/Onboarding/Onboarding_Screen.dart';
import 'screens/PopProducts/pop_products_screen.dart';
import 'screens/ProductPage/product_page.dart';

late SharedPreferences prefs;
int? isFirstLaunch;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  isFirstLaunch = prefs.getInt('isFirstLaunch');
  await prefs.setInt('isFirstLaunch', 1);
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
      initialRoute:(isFirstLaunch == 0 || isFirstLaunch == null)
          ? "onboarding"
          : prefs.getString("email") == null
              ? "login"
              : "home",
      routes: {
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
        "favorits": (context) => const FavoritsScreen(),
        "newproducts": (context) => const NewProductsScreen(),
        "popproducts": (context) => const PopProductsScreen(),
        "category": (context) => const CategorieProductsList(),
        "profile": (context) => const ProfilePage(),
        "changepass": (context) => const ChangePasswordPage(),
        "history": (context) => const OrdersHistoryScreen(),
        "historyproducts": (context) => const OrdersHistoryProductsScreen(),
        "successcheckout": (context) => const SuccessCheckoutScreen(),
      },
    );
  }
}
