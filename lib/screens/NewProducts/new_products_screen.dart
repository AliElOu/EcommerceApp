import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/widgets/custom_navbar.dart';

import '../../enums/menu_state.dart';
import '../../models/products_model.dart';
import '../PopProducts/pop_products_screen.dart';
import '../widgets/products_list_widget.dart';

class NewProductsScreen extends StatelessWidget {
  const NewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductslistArguments;
    List<ProductsModel> poductslist = args.poductsList;
    return Scaffold(
      body: ProductsListWidget(
        title: "New Products",
        productslist: poductslist,
      ),
      bottomNavigationBar: const CustomNavbar(currentPage: MenuState.home),
    );
  }
}