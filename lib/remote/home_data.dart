import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

import '../main.dart';

class HomeData {

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
      "userid" : prefs.getString('id'),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}