import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/resetpassword_data.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({required this.key});

  Crud crud = Crud();
  late ResetPasswordData resetpassworddata = ResetPasswordData(crud);

 StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  
  reset(email,password,context) async {
    if (key.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await resetpassworddata.postData(email,password);
      statusrequest = handlingData(response);

      if (statusrequest == StatusRequest.succes) {
        update();
        AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Votre mot de passe a été réinitialisé avec succes',
        desc: 'Retournez vous à la page de connection pour se connecter!',
        btnOkOnPress: () {},
      ).show();
      } 
    }
  }
}
