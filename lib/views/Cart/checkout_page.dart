import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:flutter_bootcamp/views/Cart/widgets/checkout_body.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import '../../controllers/cart_controller.dart';
import '../../enums/status_request.dart';
import '../../models/cart_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_nav_bar.dart';
import 'widgets/your_adresse_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.find<CartController>();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: const CustomAppBar(
            title: "Validation",
          )),
      body: SafeArea(
        child: GetBuilder<CartController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.statusrequest == StatusRequest.loading
                  ? SizedBox(
                      height: height - 250,
                      child: Center(
                        child: Lottie.asset("assets/lottie/loading.json",
                            width: 150, height: 150),
                      ))
                  : const CheckoutBody(),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        cntrlr: "checkout",
        btnText: "Valider",
        onpressed: () async {
          if (cartList.isNotEmpty &&
              cartcontroller.statusrequest != StatusRequest.loading) {
            if (infoskey.currentState!.validate()) {
              if (cartcontroller.selectedPayment == 1) {
                cartcontroller.checkout(
                    context, adressecntrl.text, phonecntrl.text, "cod");
              } else if (cartcontroller.selectedPayment == 3) {
                cartcontroller.paypalCheckout(
                    context, adressecntrl.text, phonecntrl.text, "checkquant");
              }
            }
          }
        },
      ),
    );
  }
}
