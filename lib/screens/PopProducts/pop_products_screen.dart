

import 'package:flutter/material.dart';

import '../../enums/menu_state.dart';
import '../../models/products_model.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/products_list_widget.dart';

class PopProductsScreen extends StatelessWidget {
  const PopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductslistArguments;
        List<ProductsModel>  poductslist = args.poductsList;
        

    return Scaffold(body: ProductsListWidget(title: "Popular Products", productslist: poductslist),bottomNavigationBar: const CustomNavbar(currentPage: MenuState.home),);
  }
}

class ProductslistArguments {
  final List<ProductsModel> poductsList;
  ProductslistArguments(this.poductsList);

}