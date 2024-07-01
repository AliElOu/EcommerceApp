import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/remote/Auth/delete_favoris_data.dart';
import 'package:flutter_bootcamp/remote/Auth/insert_favoris_data.dart';
import 'package:flutter_bootcamp/remote/home_data.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../core/functions/handling_data.dart';
import '../main.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';

class HomeController extends GetxController {
  SettingServices c = Get.find();

  Crud crud = Crud();
  late HomeData homeData = HomeData(crud);

  List<CategoriesModel> listCategories = [];
  List<ProductsModel> listNewProducts = [];

  late StatusRequest statusRequest;
  late int listL;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData(c.prefs.getString("id")!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.succes) {
      for (Map item in response['data']['cat']) {
        listCategories.add(CategoriesModel.fromJson(item));
      }
      for (Map item in response['data']['newProd']) {
        listNewProducts.add(ProductsModel.fromJson(item));
      }
      listL = listNewProducts.length;
      if (listNewProducts.length > 5) {
        listL = 5;
      }
    }
    update();
  }

  StatusRequest? statusRequest2;
  List<ProductsModel> listSearchedProducts = [];

  getSearch(String name) async {
    if (name == "") {
      update();
    } else {
      listSearchedProducts.clear();
      statusRequest2 = StatusRequest.loading;
      update();
      update(["search"]);
      var response = await homeData.getSearch(name);
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.succes) {
        for (Map item in response['data']) {
          listSearchedProducts.add(ProductsModel.fromJson(item));
        }
      }
      update(["search"]);
    }
  }

  late InsertFavorisData insertfavorisdata = InsertFavorisData(crud);
  late DeleteFavorisData deletefavorisdata = DeleteFavorisData(crud);
  StatusRequest? statusRequest3;
  late String clickedProduct;

  void toggleFavorite(ProductsModel products, BuildContext context) async {
    clickedProduct = products.id.toString();
    if (products.isFavorit == false) {
      statusRequest3 = StatusRequest.loading;
      update(["fav"]);
      var response = await insertfavorisdata.postData(products.id.toString());
      statusRequest3 = handlingData(response);
      if (statusRequest3 == StatusRequest.succes) {
        products.isFavorit = !products.isFavorit;
        update(["fav"]);
        Get.snackbar(
          "Succes",
          "Ce produit a été ajouté de votre liste de favorits avec succès",
          backgroundColor: Color.fromARGB(255, 33, 182, 112),
          margin: const EdgeInsets.all(10),
          barBlur: 5,
          duration: const Duration(seconds: 1),
        );
      } else if (statusRequest3 == StatusRequest.failure) {}
    } else {
      statusRequest3 = StatusRequest.loading;
      update(["fav"]);
      var response = await deletefavorisdata.postData(products.id.toString());
      statusRequest3 = handlingData(response);
      if (statusRequest3 == StatusRequest.succes) {
        products.isFavorit = !products.isFavorit;
        update(["fav"]);
        Get.snackbar(
          "Succes",
          "Ce produit a été Supprimé de votre liste de favorits avec succès",
          backgroundColor: Color.fromARGB(255, 240, 58, 77),
          margin: const EdgeInsets.all(10),
          barBlur: 5,
          duration: const Duration(seconds: 1),
        );
      } else if (statusRequest3 == StatusRequest.failure) {}
    }
    update(["fav"]);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> handleRefresh(RefreshController rc) async {
    listCategories.clear();
    listNewProducts.clear();
    update();
    getData();

    rc.refreshCompleted();
  }
}
