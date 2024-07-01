import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

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
            scale: 2.8,
          ),
          const SizedBox(width: 10),
          CustomIconButton(
              iconPath: "assets/icons/chat.svg",
              onPressMethod: (() => Get.toNamed("/chat"))),
          GetBuilder<ProductPageController>(builder: (controller) {
            return CustomIconButton(
              iconPath:
                  "assets/icons/carticon.svg",
              onPressMethod: () => Get.toNamed("/cart"),
            );
          }),
        ],
      ),
    );
  }
}
