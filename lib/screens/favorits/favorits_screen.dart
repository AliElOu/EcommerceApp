import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/widgets/custom_navbar.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/favorits_page_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../../enums/menu_state.dart';

import '../../main.dart';
import '../widgets/header.dart';
import '../widgets/products_list_widget.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController1 =
        RefreshController(initialRefresh: true);
    Get.put(FavoritsListController(userid: prefs.getString("id")!));
    return GetBuilder<FavoritsListController>(builder: (controller) {
      return SmartRefresher(
        controller: refreshController1,
        onRefresh: () {
          controller.handleRefresh(refreshController1);
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Header(title: "Favoris"),
          ),
          body: HandlignDataView(
              statusrequest: controller.statusrequest,
              widget: ProductsListWidget(
                productslist: controller.favoritsList,
              )),
          bottomNavigationBar: const CustomNavbar(
            currentPage: MenuState.favorite,
          ),
        ),
      );
    });
  }
}
