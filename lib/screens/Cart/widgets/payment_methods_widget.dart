import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../../../controllers/product_page_controller.dart';

List<String> pymnt = [
  "assets/images/mastercard.png",
  "assets/images/cod.png",
  "assets/images/visa.png",
  "assets/images/paypal.png",
  "assets/images/google-pay.png",
  "assets/images/apple-pay.png",
];

class PaymentMehodsWidget extends StatelessWidget {
  const PaymentMehodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Méthodes de payement",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  fontFamily: "os",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
            itemCount: pymnt.length,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GetBuilder<CartController>(
                    id: "payment",
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () => controller.changeSelectedPayment(index),
                        child: Container(
                          width: 90,
                          decoration: BoxDecoration(                            
                            border: Border.all(
                                color: index == controller.selectedPayment ? const Color(0xff4AB45E) : Colors.transparent, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffEDEEF1),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(pymnt[index]),
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ],
    );
  }
}
