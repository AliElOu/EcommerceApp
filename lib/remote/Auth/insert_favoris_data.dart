import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../main.dart';

class InsertFavorisData {
  SettingServices c = Get.find();

  Crud crud ;
  InsertFavorisData(this.crud);

  postData(String product) async{
    var response = await crud.postData(AppLinks.insertFavoris, {
      "productId" : product,
      "userId" : c.prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}