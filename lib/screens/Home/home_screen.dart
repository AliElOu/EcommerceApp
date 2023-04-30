import "package:flutter/material.dart";
import "package:flutter_bootcamp/enums/menu_state.dart";
import "widgets/categories.dart";
import "widgets/custom_appbar.dart";
import "widgets/custom_navbar.dart";
import "widgets/offers.dart";
import "widgets/popular_products.dart";
import "widgets/special_for_you.dart";


class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
               customappbar(),
               SizedBox(height: 8),
               Cashback(),
               SizedBox(height: 25),
               Categories(),
               SizedBox(height: 5),
               SpecialForYou(),
               SizedBox(height: 22),
               PopularProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  const customNavbar(CurrentPage: MenuState.home),
    );
  }
}