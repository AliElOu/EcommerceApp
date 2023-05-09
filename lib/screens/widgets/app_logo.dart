import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double scale;
  const AppLogo({
    super.key,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      scale: scale,
    );
  }
}