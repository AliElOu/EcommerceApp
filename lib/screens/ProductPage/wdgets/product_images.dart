import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final String id;
  const ProductImage({super.key, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();
    productController.selectedQuantity = 0;
    productController.selectedColor = 0;
    productController.isExpanded = false;

    return Column(
      children: [
        Container(
            alignment: Alignment.topCenter,
            height: 145,
            width: 200,
            child: 
               Hero(
                  tag: id,
                  child: Image.asset(
                    image,
                  ))
           ),
       
      ],
    );
  }
}
