import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../main.dart';

class HomeData {
  SettingServices c = Get.find();

  Crud crud ;
  HomeData(this.crud);

  getData(String id) async{
    var response = await crud.postData(AppLinks.home, {
      "userid" : id,
    });
    return response.fold((l) => l, (r) => r) ;
  }

  getSearch(String name) async{
    var response = await crud.postData(AppLinks.search, {
      "productName" : name,
      "userid" : c.prefs.getString('id'),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}