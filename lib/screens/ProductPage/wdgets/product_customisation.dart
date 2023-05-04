import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/product_page_controller.dart';
import 'package:get/get.dart';
import '../../../models/products_model.dart';
import 'add_to_cart.dart';

class ProductCustomisation extends StatelessWidget {
  final ProductsModel products;
  const ProductCustomisation({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    ProductPageController productController = Get.find<ProductPageController>();
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Color(0xffEEF0F1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    products.colors.length,
                    (index) => GetBuilder<ProductPageController>(
                        init: ProductPageController(),
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectColor(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 3),
                              padding: const EdgeInsets.all(5),
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: controller.selectedColor == index
                                        ? const Color(0xffF77547)
                                        : Colors.transparent),
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: products.colors[index],
                                ),
                              ),
                            ),
                          );
                        })),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        productController.decrementQuantity();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GetBuilder<ProductPageController>(
                        init: ProductPageController(),
                        builder: (controller) {
                          return SizedBox(
                              width: 23,
                              height: 20,
                              child: Text(
                                  controller.selectedQuantity.toString(),
                                  style: const TextStyle(
                                      fontFamily: "Kanit", fontSize: 16)));
                        }),
                    InkWell(
                      onTap: () {
                        productController.incrementQuantity(products.quantity);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          addToCart(products: products)
        ],
      ),
    );
  }
}

int selectedColor = 0;
int selectedQaunt = 0;
