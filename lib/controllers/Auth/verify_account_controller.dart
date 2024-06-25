import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/verify_account_data.dart';

class VerifyAccountController extends GetxController {
  Crud crud = Crud();
  late VerifyAccountData verifyaccountdata = VerifyAccountData(crud);

  StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  postData(email, otp, context) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await verifyaccountdata.postData(email, otp);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.succes) {
      update();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Votre compte à été vérifié avec succes',
        desc: 'Retournez vous à la page de connection pour se connecter!',
        btnOkOnPress: () {
          Get.back();
        },
      ).show();
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
