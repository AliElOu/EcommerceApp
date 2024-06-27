import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/verify_reset_password_data.dart';
import '../../views/Auth/verify_reset_password_screen.dart';

class VerifyResetPasswordController extends GetxController {
  Crud crud = Crud();
  late VerifyResetPasswordData verifyresetpassworddata = VerifyResetPasswordData(crud);

  StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  postData(email, otp, context) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await verifyresetpassworddata.postData(email, otp);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.succes) {
      update();
      Navigator.pushReplacementNamed(context, "resetpassword",arguments: OTPverificationArguments(email));
    } else if (statusrequest == StatusRequest.failure) {
      update();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Erreur',
        desc: 'Le code que vous avez entrer est incorrecte.',
        btnCancelOnPress: () {},
      ).show();
    }
  }
}
