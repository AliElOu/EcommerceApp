import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(31, 158, 158, 158),
            borderRadius: BorderRadius.circular(15)),
        child: const Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search product",
              prefixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIconColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
