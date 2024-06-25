import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/api_links.dart';
import 'package:get/get.dart';

import '../../../controllers/profile/order_history_products_controller.dart';

class OrderProductsListWidget extends StatelessWidget {
  const OrderProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OrderHistoryProductsController ordershistoryproductscontroller =
        Get.find<OrderHistoryProductsController>();
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(children: [
        Text(
          "Total : ${ordershistoryproductscontroller.total}Dh",
          style: const TextStyle(
              fontSize: 25, fontFamily: "os", fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Divider(color: Colors.grey),
        ),
        const SizedBox(height: 5),
        ...List.generate(
          ordershistoryproductscontroller.productsList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SizedBox(
              height: 80,
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffEDEEF1),
                    ),
                    child: Image.network(
                        "${AppLinks.images}${ordershistoryproductscontroller.productsList[index].image}"),
                  ),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width - 150,
                        height: 36,
                        child: Text(
                          ordershistoryproductscontroller
                              .productsList[index].name,
                          style: const TextStyle(
                              fontFamily: "ubuntu", fontSize: 15, height: 1.3),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                              "${ordershistoryproductscontroller.productsList[index].price}Dh",
                              style: const TextStyle(
                                fontFamily: "ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 1.3,
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "x${ordershistoryproductscontroller.productsList[index].quantity}",
                            style: const TextStyle(
                              fontFamily: "ubuntu",
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
