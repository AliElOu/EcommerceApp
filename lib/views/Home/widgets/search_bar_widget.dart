import 'package:flutter/material.dart';

import '../../../controllers/home_controller.dart';

class SearchBarr extends StatelessWidget {
  final HomeController hc;
  const SearchBarr({super.key, required this.hc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(31, 158, 158, 158),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: TextField(
          onChanged: (value) {
            hc.getSearch(value);
          },
          decoration: const InputDecoration(
            hintText: "Chercher un produit",
            prefixIcon: Icon(Icons.search),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIconColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
