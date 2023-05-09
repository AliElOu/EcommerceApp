import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
    "MediShop © 2023",
    style: TextStyle(color: Color(0xffAEAEAE), fontSize: 12),
                );
  }
}