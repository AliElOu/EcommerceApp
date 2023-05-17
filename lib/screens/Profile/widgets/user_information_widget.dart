import 'package:flutter/material.dart';

import '../../../main.dart';

class UserInformationWidget extends StatelessWidget {
  final String title;
  final String info;
  const UserInformationWidget({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(164, 0, 0, 0),
            fontFamily: "os",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          prefs.getString(info)!,
          style: const TextStyle(
            color: Color.fromARGB(255, 175, 175, 175),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
