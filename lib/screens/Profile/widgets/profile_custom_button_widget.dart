import 'package:flutter/material.dart';

class ProfileCustomButtonWidget extends StatelessWidget {
  const ProfileCustomButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    required this.horiz,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback press;
  final double horiz;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horiz, vertical: 10),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 238, 240),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: const Color(0xff52C560),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 18,
                    color: Color.fromARGB(255, 131, 131, 131),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Color.fromARGB(255, 131, 131, 131),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
