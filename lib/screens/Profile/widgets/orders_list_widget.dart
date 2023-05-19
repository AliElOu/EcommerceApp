import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profile/orders_histroy_controller.dart';
import '../orders_history_products_screen.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrdersHistoryController ordershistorycontroller = Get.find<OrdersHistoryController>();
    return SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
        child: Column(
          children: List.generate(
            ordershistorycontroller.ordersList.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "historyproducts",arguments: OrdersHistoryProductsArguments(ordershistorycontroller.ordersList[index].id));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 140,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              "INV/${ordershistorycontroller.ordersList[index].id}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Kanit",
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              ordershistorycontroller.ordersList[index].date,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Kanit",
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Status : ${ordershistorycontroller.ordersList[index].status}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: "Kanit",
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
