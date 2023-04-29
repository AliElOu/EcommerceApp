import 'package:flutter/material.dart';
import 'categories_icon_button.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          custom_category_icon_button(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Flash%20Icon.svg",title: "Flash\nDeal"),
          custom_category_icon_button(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Bill%20Icon.svg",title: "Bill"),
          custom_category_icon_button(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Game%20Icon.svg",title: "Game"),
          custom_category_icon_button(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Gift%20Icon.svg",title: "Daily\nGift"),
          custom_category_icon_button(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Discover.svg",title: "More")
        ],
      ),
    );
  }
}

