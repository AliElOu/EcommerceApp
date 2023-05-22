import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/Profile/widgets/order_products_list_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/profile/order_history_products_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../widgets/header.dart';

class OrdersHistoryProductsScreen extends StatelessWidget {
  const OrdersHistoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as OrdersHistoryProductsArguments;
    String id = args.id;
    RefreshController refreshController1 =
        RefreshController(initialRefresh: true);
    Get.put(OrderHistoryProductsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 62,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: Header(title: "Détails du commande"),
        ),
      ),
      body: GetBuilder<OrderHistoryProductsController>(
        builder: (controller) {
          return SmartRefresher(
            controller: refreshController1,
            onRefresh: () {
              controller.handleRefresh(refreshController1, id);
            },
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: HandlignDataView(
                    statusrequest: controller.statusrequest,
                    widget: const OrderProductsListWidget()),
              ),
            ),
          );
        },
      ),
      
    );
  }
}

class OrdersHistoryProductsArguments {
  final String id;
  OrdersHistoryProductsArguments(this.id);
}
