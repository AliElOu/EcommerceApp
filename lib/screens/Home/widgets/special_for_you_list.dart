import 'package:flutter/material.dart';

import '../../../models/special_for_you_model.dart';

class SpecialForYouList extends StatelessWidget {
  final SpecialForYouModel offer;
  const SpecialForYouList({
    required this.offer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      width: 218,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: 218,
              height: 100,
              child: Image.network(offer.imagePath, fit: BoxFit.cover),
            ),
            Container(
              width: 218,
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1)
                  ])),
            ),
            Positioned(
              top: 14,
              left: 17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: "os",
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${offer.brands} Brands",
                    style: const TextStyle(
                      color: Color.fromARGB(232, 255, 255, 255),
                      fontSize: 14,
                      fontFamily: "os",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
