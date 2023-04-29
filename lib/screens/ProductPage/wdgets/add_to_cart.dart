import 'package:flutter/material.dart';

class addToCart extends StatelessWidget {
  const addToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 22),
      width: double.maxFinite,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xffF77547)
        ),
        child: Text("Add to Chart"),
        onPressed: (){},
      ),
    );
  }
}