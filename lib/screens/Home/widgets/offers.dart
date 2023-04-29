import 'package:flutter/material.dart';

class Cashback extends StatelessWidget {
  const Cashback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
       margin: const EdgeInsets.symmetric(horizontal: 23),
      decoration: BoxDecoration(
        color: const Color(0xff5E5296),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("A Summer Surprise",style: TextStyle(color: Color.fromARGB(192, 255, 255, 255),fontSize: 11),),
          Text("Cashback 20%",style: TextStyle(color: Color.fromARGB(237, 255, 255, 255),fontSize: 25,fontFamily: "Kanit")),
        ],
      ),
    );
  }
}