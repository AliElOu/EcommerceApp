import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../widgets/app_logo.dart';
import 'custom_icon_button.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      width: double.infinity,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(
            scale: 2.5,
          ),
          const SizedBox(width: 10),
          GetBuilder<ProductPageController>(builder: (controller) {
            return CustomIconButton(
              iconPath:
                  "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Cart%20Icon.svg",
              onPressMethod: () => Get.toNamed("/cart"),
            );
          }),
        ],
      ),
    );
  }
}
