import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class ForgetPasswordData {

  Crud crud ;
  ForgetPasswordData(this.crud);

  postData(String email) async{
    var response = await crud.postData(AppLinks.verifyResetPassword, {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}