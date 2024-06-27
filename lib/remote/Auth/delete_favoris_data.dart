import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../main.dart';

class DeleteFavorisData {
  SettingServices c = Get.find();

  Crud crud ;
  DeleteFavorisData(this.crud);

  postData(String product) async{
    var response = await crud.postData(AppLinks.deleteFavoris, {
      "productId" : product,
      "userId" : c.prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}