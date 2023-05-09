import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({
    super.key, required this.text, required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(209, 255, 255, 255),
        backgroundColor: const Color(0xff52C560),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 80,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () { onpressed() ;},
      child:  Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "os",
        ),
      ),
    );
  }
}