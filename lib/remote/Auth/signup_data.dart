import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class SignUpData {

  Crud crud ;
  SignUpData(this.crud);

  postData(String username,String password,String email,String adresse,String phone) async{
    var response = await crud.postData(AppLinks.signup, {
      "username" : username,
      "password" : password,
      "email" : email,
      "adresse" : adresse,
      "phone" : phone,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}