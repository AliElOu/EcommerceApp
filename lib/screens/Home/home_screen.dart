import "package:flutter/material.dart";
import "package:flutter_bootcamp/controllers/product_page_controller.dart";
import "package:flutter_bootcamp/enums/menu_state.dart";
import "package:get/get.dart";
import "package:pull_to_refresh/pull_to_refresh.dart";
import "../../controllers/home_controller.dart";
import "../../core/classes/handling_data_view.dart";
import "../PopProducts/pop_products_screen.dart";
import "widgets/categories.dart";
import "widgets/custom_appbar.dart";
import '../widgets/custom_navbar.dart';
import "widgets/popular_products.dart";
import "widgets/search_bar_widget.dart";

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProductPageController());
    RefreshController refreshController1 =
        RefreshController(initialRefresh: false);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (controller) {
          return SmartRefresher(
            controller: refreshController1,
            onRefresh: () {
              controller.handleRefresh(refreshController1);
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: HandlignDataView(
                statusrequest: controller.statusRequest,
                widget: Column(
                  children: [
                    const Customappbar(),
                    const SizedBox(height: 5),
                    const SearchBar(),
                    const SizedBox(height: 15),
                    Categories(
                      categorieslist: controller.listCategories,
                    ),
                    const SizedBox(height: 5),
                    HomeProductsList(
                      title: "New Products",
                      lnp: controller.listNewProducts,
                      Seemoremethod: () =>
                          Navigator.pushNamed(context, "newproducts",arguments: ProductslistArguments(controller.listNewProducts)),
                    ),
                    HomeProductsList(
                      title: "Popular Products",
                      lnp: controller.listPopProducts,
                      Seemoremethod: () =>
                          Navigator.pushNamed(context, "popproducts",arguments: ProductslistArguments(controller.listPopProducts)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: const CustomNavbar(currentPage: MenuState.home),
    );
  }
}
