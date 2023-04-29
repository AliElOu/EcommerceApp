import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
    String iconPath;
   CustomIconButton({
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
              color:Color.fromARGB(31, 158, 158, 158) ,
              shape: BoxShape.circle,
            ),
      child: IconButton(
          highlightColor: Colors.transparent,
          splashColor:Colors.transparent ,
          hoverColor: Colors.transparent,
          padding: const EdgeInsets.all(10),
          onPressed: (){},
          icon: SvgPicture.network(iconPath),
          color: Colors.grey,
          ),
        );
  }
}