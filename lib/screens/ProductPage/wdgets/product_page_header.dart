import 'package:flutter/material.dart';

class ProductPageHeader extends StatelessWidget {
  final double rating;
  const ProductPageHeader({
    required this.rating,
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
              Navigator.pop(context);
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
          Container(
            height: 28,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$rating",
                  style: const TextStyle(
                      fontFamily: "Kanit",
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
