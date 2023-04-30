import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_icon_button.dart';

class customappbar extends StatelessWidget {
  const customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 18),
      width: double.infinity,
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(31, 158, 158, 158),
                borderRadius: BorderRadius.circular(20)
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search product",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIconColor: Colors.grey,
              ),
              ),
            )
          ),
          const SizedBox(width: 10),
          CustomIconButton(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Cart%20Icon.svg",onPressMethod: () => Navigator.pushNamed(context, "cart"),),
          const SizedBox(width: 7),
          CustomIconButton(iconPath: "https://raw.githubusercontent.com/GDG-Guelmim/flutter_bootcamp_2023_ecommerce_app/9d0471efd43ce3fa1fb59aec0abdfb005483f9b5/assets/icons/Bell.svg",onPressMethod:(){})
        ],
      ),
    );
  }
}

