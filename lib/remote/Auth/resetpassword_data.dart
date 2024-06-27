import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class ResetPasswordData {

  Crud crud ;
  ResetPasswordData(this.crud);

  postData(String email,String password) async{
    var response = await crud.postData(AppLinks.resetPassword, {
      "password" : password,
      "email" : email,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}