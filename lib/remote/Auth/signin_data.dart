import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class SignInData {

  Crud crud ;
  SignInData(this.crud);

  postData(String password,String email) async{
    var response = await crud.postData(AppLinks.signin, {
      "password" : password,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}