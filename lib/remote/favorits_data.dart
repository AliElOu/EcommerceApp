import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class FavoritsData {

  Crud crud ;
  FavoritsData(this.crud);

  postData(String userid) async{
    var response = await crud.postData(AppLinks.favoritsList, {
      "userId" : userid,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}