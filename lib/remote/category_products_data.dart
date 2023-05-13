import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

import '../main.dart';

class CategoryProductsData {

  Crud crud ;
  CategoryProductsData(this.crud);

  postData(String catid) async{
    var response = await crud.postData(AppLinks.categorieProducts, {
      "catId" : catid,
      "userid" : prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}