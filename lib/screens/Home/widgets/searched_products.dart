import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../ProductPage/product_page.dart';

class SearchedProductsList extends StatelessWidget {
  const SearchedProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "search",
        builder: (controller) {
          
          return SafeArea(
            child: HandlignDataView(
              statusrequest: controller.statusRequest2,
              widget: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    for (int index = 0;
                        index < controller.listSearchedProducts.length;
                        index++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 6),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () async {
                            Navigator.pushNamed(context, "product",
                                arguments: ProductPageArguments(
                                    controller.listSearchedProducts[index],
                                    "${controller.listSearchedProducts[index].id}"));
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Hero(
                                  tag: "${controller.listSearchedProducts[index].id}",
                                  child: Image.asset(
                                    controller.listSearchedProducts[index].image,
                                    width: 75,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      controller
                                          .listSearchedProducts[index].name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "${controller.listSearchedProducts[index].price} \$",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        controller
                                            .listSearchedProducts[index].rating
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
