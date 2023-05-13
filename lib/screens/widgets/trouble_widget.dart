import 'package:flutter/material.dart';

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
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
          height: height - 100,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              const SizedBox(
                height: 25,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
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
                fontSize: 17,
                fontFamily: "os",
              ),
              textAlign: TextAlign.center,
            ),
            ],
          ))),
    );
  }
}
