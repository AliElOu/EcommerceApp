
import 'package:flutter/material.dart';

import '../../models/products_model.dart';
import 'wdgets/product_details.dart';
import 'wdgets/product_images.dart';
import 'wdgets/product_page_header.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductPageArguments;
    ProductsModel products = args.pList;
    return  Scaffold(
      backgroundColor: const Color(0xffF4F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              ProductPageHeader(rating: products.rating,),
              ProductImages(Images: products.images,id: products.id),
              const SizedBox(height: 25),
              ProductDetails(products: products,),
            ],
          ),
        )
      ),
    );
  }
}



class ProductPageArguments {
  final ProductsModel pList;

  ProductPageArguments(this.pList);
}

