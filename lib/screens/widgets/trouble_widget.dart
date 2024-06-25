import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/api_links.dart';

class TroubleWidget extends StatelessWidget {
  final String text;
  final String image;
  final String description;
  const TroubleWidget({
    super.key,
    required this.text,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double Dheight = MediaQuery.of(context).size.height;
    double Dwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "${AppLinks.images}${image}",
            height: Dheight - 457,
            width: Dwidth - 161,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "os",
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: const TextStyle(
              color: Color.fromARGB(255, 133, 133, 133),
              fontSize: 15,
              fontFamily: "os",
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ))),
    );
  }
}
