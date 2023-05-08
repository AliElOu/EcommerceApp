import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/home_controller.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: Text("Loading ..."));
        } else if (controller.statusRequest == StatusRequest.failure) {
          return const Center(child: Text("No data"));
        } else if (controller.statusRequest == StatusRequest.offlineFailure) {
          return const Center(child: Text("No Connection"));
        } else if (controller.statusRequest == StatusRequest.serverFailure) {
          return const Center(child: Text("Server failure"));
        } else {
          return Center(child: Text("${controller.data}"));
        }
      },
    );
  }
}
