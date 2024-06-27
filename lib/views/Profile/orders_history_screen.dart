import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/views/Profile/widgets/orders_list_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../controllers/profile/orders_histroy_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../../enums/status_request.dart';
import '../widgets/header.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController1 =
        RefreshController(initialRefresh: true);
    Get.put(OrdersHistoryController());
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 62,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Header(title: "Historique des commandes"),
          )),
      body: GetBuilder<OrdersHistoryController>(builder: (controller) {
        return SmartRefresher(
          controller: refreshController1,
          onRefresh: () {
            controller.handleRefresh(refreshController1);
          },
          child:HandlignDataView(
                  statusrequest: controller.statusrequest,
                  widget: const OrdersListWidget(),
                ),
        );
      }),
    );
  }
}
