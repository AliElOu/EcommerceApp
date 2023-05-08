import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class HomeData {

  Crud crud ;
  HomeData(this.crud);

  getData() async{
    var response = await crud.postData(AppLinks.home, {});
    return response.fold((l) => l, (r) => r) ;
  }
  
}