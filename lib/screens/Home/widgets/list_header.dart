import 'package:flutter/material.dart';

class listHeader extends StatelessWidget {
  String title;
   listHeader({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(title,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "Kanit",
            ),),
            GestureDetector(
              onTap: () {},
              child: const Text("See more",
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