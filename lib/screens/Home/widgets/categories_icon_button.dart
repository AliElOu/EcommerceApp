import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class custom_category_icon_button extends StatelessWidget {
  String iconPath;
  String title;
   custom_category_icon_button({
    required this.iconPath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: const Color(0xffF9E7DA),
            borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(onPressed: (){},
           icon: SvgPicture.network(iconPath),
           highlightColor: Colors.transparent,
           splashColor:Colors.transparent ,
           hoverColor: Colors.transparent,
           ),
        ),
        const SizedBox(height: 5),
         Text(title,
         style: const TextStyle(
          color: Color.fromARGB(172, 158, 158, 158),
          fontSize: 16,
          fontFamily: "Kanit",
          height: 1.1
          ),
          textAlign: TextAlign.center,
         ),
      ],
    );
  }
}