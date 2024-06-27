import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../main.dart';

class CategoryProductsData {
  SettingServices c = Get.find();

  Crud crud ;
  CategoryProductsData(this.crud);

  postData(String catid) async{
    var response = await crud.postData(AppLinks.categorieProducts, {
      "catId" : catid,
      "userid" : c.prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}