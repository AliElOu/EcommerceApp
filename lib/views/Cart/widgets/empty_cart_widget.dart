import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/api_links.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: height - 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("${AppLinks.images}empty_cart_ilustration.png"),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Oups, il n'y a aucun produit dans votre panier",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: "os",
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Votre panier est encore vide, parcourez les produits attractifs de MediShop",
              style: TextStyle(
                color: Color.fromARGB(255, 133, 133, 133),
                fontSize: 17,
                fontFamily: "os",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
