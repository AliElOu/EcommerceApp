import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';

class HomeController extends GetxController {
  Crud crud = Crud();
  late HomeData homeData = HomeData(crud);

  List<CategoriesModel> listCategories = [];
  List<ProductsModel> listNewProducts = [/*
    ProductsModel(
      description: "sqdsqdqsd",
      rating: 2.5,
      quantity: 10,
      image: "https://images-platform.99static.com/3oCnvqvgKmK-6oZ7CzNZnrBhBdE=/106x848:1469x2211/500x500/top/smart/99designs-contests-attachments/86/86064/attachment_86064461",
      name: "dwa dyal saratan",
      price: 66,
      isFavorit: false,
      id: 1,
    ),
    ProductsModel(
      description: "dfsdfsdfsd",
      rating: 3.0,
      quantity: 5,
      image: "https://images-platform.99static.com/gBLkbm-56cKYeDb1NpKncFGEF_A=/52x857:1406x2211/500x500/top/smart/99designs-contests-attachments/86/86064/attachment_86064715",
      name: "dwa dyal sida",
      price: 12.30,
      isFavorit: false,
      id: 2,
    ),
  */];
  List<ProductsModel> listPopProducts = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = HandlingData(response);

    if (statusRequest == StatusRequest.succes) {
      for (Map item in response['data']['cat']) {
        listCategories.add(CategoriesModel.fromJson(item));
      }
      for (Map item in response['data']['newProd']) {
        listNewProducts.add(ProductsModel.fromJson(item));
      }
      for (Map item in response['data']['popProd']) {
        listPopProducts.add(ProductsModel.fromJson(item));
      }

      print(listCategories[0].name);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
