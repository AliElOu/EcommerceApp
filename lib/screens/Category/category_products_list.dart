import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/handling_data_view.dart';
import 'package:flutter_bootcamp/screens/widgets/products_list_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/category_products_controller.dart';
import '../../enums/menu_state.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/header.dart';

class CategorieProductsList extends StatelessWidget {
  const CategorieProductsList({super.key});

  @override
  Widget build(BuildContext context) {

    RefreshController refreshController1 =
        RefreshController(initialRefresh: true);
    final args = ModalRoute.of(context)!.settings.arguments
        as CategorieProductsArguments;
    String name = args.name;
    String id = args.id.toString();


    Get.put(CategoryProductsController());

    return GetBuilder<CategoryProductsController>(builder: (controller) {
      return SmartRefresher(
        controller: refreshController1,
        onRefresh: () {
          controller.handleRefresh(refreshController1,id);
        },
        child: Scaffold(
          appBar: AppBar(
        toolbarHeight: 100,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Header(title: name),
      ),
          body: SafeArea(
            child: HandlignDataView(
              statusrequest: controller.statusrequest,
              widget: ProductsListWidget(
                  productslist: controller.listCatProducts,
                  ),
            ),
          ),
          bottomNavigationBar: const CustomNavbar(currentPage: MenuState.home),
        ),
      );
    });
  }
}

class CategorieProductsArguments {
  final String name;
  final int id;
  CategorieProductsArguments(this.name, this.id);
}
