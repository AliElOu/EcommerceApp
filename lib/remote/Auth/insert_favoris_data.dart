import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

import '../../main.dart';

class InsertFavorisData {

  Crud crud ;
  InsertFavorisData(this.crud);

  postData(String product) async{
    var response = await crud.postData(AppLinks.insertFavoris, {
      "productId" : product,
      "userId" : prefs.getString("id"),
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}