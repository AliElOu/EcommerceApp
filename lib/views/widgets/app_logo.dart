import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/api_links.dart';

class AppLogo extends StatelessWidget {
  final double scale;
  const AppLogo({
    super.key,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "${AppLinks.images}logo.png",
      scale: scale,
    );
  }
}