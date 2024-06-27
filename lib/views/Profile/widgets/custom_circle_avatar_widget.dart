import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/api_links.dart';


class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 150,
        width: 150,
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 228, 228, 228),    
          child: Image.network("${AppLinks.images}user.png"),
        ));
  }
}
