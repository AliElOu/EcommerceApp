import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/favorits_page_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../../enums/menu_state.dart';

import '../../main.dart';
import '../widgets/products_list_widget.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController1 =
        RefreshController(initialRefresh: false);
    Get.put(FavoritsListController(userid: prefs.getString("id")!));
    return GetBuilder<FavoritsListController>(
      builder: (controller) {
        return SmartRefresher(
          controller: refreshController1 ,
        onRefresh: () {
              controller.handleRefresh(refreshController1);
            },
          child: Scaffold(
              body: HandlignDataView(
                statusrequest:controller.statusrequest ,
                  widget: ProductsListWidget(
                      title: "Favorits",
                      productslist: controller.favoritsList,
                      currentpage: MenuState.favorite))),
        );
      }
    );
  }
}
