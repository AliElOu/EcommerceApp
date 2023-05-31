import 'package:flutter/material.dart';

class CustomCategoryIconButton extends StatelessWidget {
  final String iconPath;
  final String title;
  const CustomCategoryIconButton({
    required this.iconPath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(iconPath)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "os",
                height: 1.1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
