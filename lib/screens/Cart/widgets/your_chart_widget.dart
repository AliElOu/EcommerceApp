import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/models/cart_model.dart';

class YourChartWidget extends StatelessWidget {
  const YourChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            "Ton panier",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
              fontFamily: "os",
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: ListView.builder(
            itemCount: cartList.length,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 105,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffEDEEF1),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: Image.asset(cartList[index].product.image),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
