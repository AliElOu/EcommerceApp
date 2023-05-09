import 'package:get/get.dart';

class SignInController extends GetxController {
  bool isCheked = false;
  bool isVisible = false;

  void changeRememberMe() {
    isCheked = !isCheked;
    update(["rememberme"]);
  }

}