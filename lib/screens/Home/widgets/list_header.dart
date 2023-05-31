import 'package:flutter/material.dart';

class listHeader extends StatelessWidget {
  String title;
  final VoidCallback SeeMoreMethod;
  listHeader({
    required this.title,
    super.key, required this.SeeMoreMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Kanit",
              ),
            ),
            GestureDetector(
              onTap: () {SeeMoreMethod();},
              child: const Text(
                "Voir plus",
                style: TextStyle(
                  color: Color.fromARGB(146, 158, 158, 158),
                  fontSize: 13.5,
                  fontFamily: "Kanit",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
