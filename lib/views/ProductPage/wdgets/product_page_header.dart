import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageHeader extends StatelessWidget {
  const ProductPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 17)),
          ),
          const Icon(
            Icons.data_array,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
