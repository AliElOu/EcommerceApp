import "package:flutter/material.dart";
import "package:flutter_bootcamp/controllers/product_page_controller.dart";
import "package:flutter_bootcamp/enums/menu_state.dart";
import "package:flutter_bootcamp/views/Home/widgets/popular_products.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:pull_to_refresh/pull_to_refresh.dart";
import '../../controllers/cart_controller.dart';
import '../../controllers/home_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../../enums/status_request.dart';
import "../PopProducts/pop_products_screen.dart";
import "widgets/categories.dart";
import "widgets/custom_appbar.dart";
import '../widgets/custom_navbar.dart';
import "widgets/search_bar_widget.dart";
import "widgets/searched_products.dart";

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homecontroller = Get.put(HomeController());
    Get.put(ProductPageController());
    Get.put(CartController());
    RefreshController refreshController1 =
        RefreshController(initialRefresh: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 150.w,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Customappbar(),
            const SizedBox(height: 5),
            SearchBarr(
              hc: homecontroller,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (controller) {
          return controller.statusRequest2 == StatusRequest.loading
              ? const SearchedProductsList()
              : SmartRefresher(
                  controller: refreshController1,
                  onRefresh: () {
                    controller.handleRefresh(refreshController1);
                  },
                  child: HandlignDataView(
                    statusrequest: controller.statusRequest,
                    widget: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Categories(
                            categorieslist: controller.listCategories,
                          ),
                          const SizedBox(height: 5),
                          HomeProductsList(
                            title: "Nouveaux produits",
                            lnp: controller.listNewProducts,
                            Seemoremethod: () => Get.toNamed("/newproducts",
                                arguments: ProductslistArguments(
                                    controller.listNewProducts)),
                          ),
                          HomeProductsList(
                            title: "Produits populaires",
                            lnp: controller.listNewProducts,
                            Seemoremethod: () => Get.toNamed("/popproducts",
                                arguments: ProductslistArguments(
                                    controller.listNewProducts)),
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
