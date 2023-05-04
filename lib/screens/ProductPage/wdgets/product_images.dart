import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';

class ProductImages extends StatefulWidget {
  final List<String> images;
  final int id;
  const ProductImages({super.key, required this.images, required this.id});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();
    productController.selectedImage = 0;
    productController.selectedQuantity = 0;
    productController.selectedColor = 0;
    productController.isExpanded = false;

    return Column(
      children: [
        Container(
            alignment: Alignment.topCenter,
            height: 145,
            width: 200,
            child: GetBuilder<ProductPageController>(builder: (controller) {
              return Hero(
                  tag: widget.id,
                  child: Image.network(
                    widget.images[controller.selectedImage],
                  ));
            })),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              widget.images.length,
              (index) => GestureDetector(
                    onTap: () {
                      productController.changeSelectedImage(index);
                    },
                    child: GetBuilder<ProductPageController>(
                        builder: (controller) {
                      return Container(
                        height: 45,
                        width: 45,
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: index == controller.selectedImage
                              ? Border.all(color: const Color(0xffF77547))
                              : Border.all(color: Colors.transparent),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(widget.images[index]),
                      );
                    }),
                  )),
        )
      ],
    );
  }
}
