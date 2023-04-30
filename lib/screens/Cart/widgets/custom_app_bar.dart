import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black.withOpacity(.6),size: 18,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Your Cart",style: TextStyle(
                fontSize: 23,
                fontFamily: "Kanit",
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600
              ),),
              Text("${cartList.length} items",style: TextStyle(
                fontSize: 15,
                fontFamily: "Kanit",
                color: Colors.black.withOpacity(.4),
                fontWeight: FontWeight.w600
              ),)
            ],
          ),
           const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,)
        ],
      ),
    );
  }
}