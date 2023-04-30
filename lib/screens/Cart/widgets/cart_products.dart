

import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';

class cartProductsList extends StatelessWidget {
  const cartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(cartList.length, (index) => Container(
        height: 120,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Row(
          children: [
            Container(
            height: 110,
            width: 90,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffEDEEF1),
            ),
            child: Image.network(cartList[index].product.images[0]),            
          ),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  height: 50,
                   child: Text(cartList[index].product.name,style: const TextStyle(
                    fontFamily: "ubuntu",
                    fontSize: 15,
                    height: 1.3
                        ),
                      ),
                 ),
                 Row(
                   children: [
                     Text("\$${cartList[index].product.price}",
                        style: TextStyle(
                          fontFamily: "ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          height: 1.3,
                          color: Colors.orange.shade700
                          ),
                        ),
                        const SizedBox(width: 7,),
                      Text("x${cartList[index].quantity.toString()}",style: const TextStyle(
                          fontFamily: "ubuntu",
                          fontSize: 15,
                          height: 1.3,
                          ),),
                   ],
                 ),
            ],
          )
          ],
        ),
      )),
    );
  }
}