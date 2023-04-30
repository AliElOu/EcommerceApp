
import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    double total=0;
    for(int i=0 ; i<cartList.length ;i++){
      total = total + cartList[i].quantity * cartList[i].product.price;
    }
    return  Container(
      color: Colors.white,
      height: 100,
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(40,20,20,20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total:",style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 16,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.4)
                          ),),
              Text("\$${total.toString()}",style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 17,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.7)
                          ),)
            ],
          ),
           TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 55,vertical: 23),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          foregroundColor: Colors.white.withOpacity(.9),
          backgroundColor: Color(0xffF77547)
        ),
        child: Text("Check Out",style: TextStyle(fontSize: 18),),
        onPressed: (){},
      ),
        ],
      ),
    );
  }
}