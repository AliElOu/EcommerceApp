import "package:flutter/material.dart";
import "package:flutter_bootcamp/enums/menu_state.dart";
import "package:get/get.dart";
import "../../controllers/home_controller.dart";
import "../../core/classes/handling_data_view.dart";
import "home_test.dart";
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<HomeController>(builder: (controller) {
            return HandlignDataView(
              statusrequest: controller.statusRequest,
              widget: Column(
                children: [
                  const Customappbar(),
                  const SizedBox(height: 5),
                  const SearchBar(),
                  const SizedBox(height: 15),
                   Categories(categorieslist: controller.listCategories,),
                  HomeProductsList(
                    title: "New Products",
                    lnp: controller.listNewProducts,
                  ),
                  HomeProductsList(
                      title: "Popular Products",
                      lnp: controller.listPopProducts),
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(currentPage: MenuState.home),
    );
  }
}
