import 'package:flutter/material.dart';

import '../../models/products_model.dart';
import '../Home/widgets/popular_products_list.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductsModel> productslist;
  const ProductsListWidget({
    super.key, required this.productslist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
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