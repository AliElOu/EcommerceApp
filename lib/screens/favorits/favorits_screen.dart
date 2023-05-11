import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/widgets/custom_navbar.dart';

import '../../enums/menu_state.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 290,
          mainAxisSpacing: 20,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return Container();
        },
        itemCount: 5,
      )),
      bottomNavigationBar: CustomNavbar(
        currentPage: MenuState.favorite,
      ),
    );
  }
}
