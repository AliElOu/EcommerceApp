import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';

class VerifyAccountData {

  Crud crud ;
  VerifyAccountData(this.crud);

  postData(String email,String otp) async{
    var response = await crud.postData(AppLinks.verifyAccount, {
      "email" : email,
      "otp" : otp,

    });
    return response.fold((l) => l, (r) => r) ;
  }
  
}