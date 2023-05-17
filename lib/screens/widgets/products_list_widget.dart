import 'package:flutter/material.dart';

import '../../enums/menu_state.dart';
import '../../models/products_model.dart';
import '../Home/widgets/popular_products_list.dart';
import 'header.dart';

class ProductsListWidget extends StatelessWidget {
  final String title;
  final List<ProductsModel> productslist;
  const ProductsListWidget({
    super.key, required this.title, required this.productslist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Header(title: title),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return ProductsList(
                products: productslist[index],
                tag: "",
                height: 185,
                width: 170,
              );
            },
            itemCount: productslist.length,
          ),
        ),
      ),
      
    );
  }
}