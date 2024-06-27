import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../../core/functions/handling_data.dart';
import '../../../remote/Auth/resetpassword_data.dart';
import '../../main.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController({required this.key});
  
  SettingServices c = Get.find();

  Crud crud = Crud();
  late ResetPasswordData resetpassworddata = ResetPasswordData(crud);

  StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  reset(email, password, context) async {
    if (key.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await resetpassworddata.postData(email, password);
      statusrequest = handlingData(response);
      if (statusrequest == StatusRequest.succes) {
        String pass = md5.convert(utf8.encode(password)).toString();
        c.prefs.setString('pass', pass);
        update();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Succes',
          desc: 'Votre mot de passe est modifié avec succes',
          btnOkOnPress: () {
            Get.back();
          },
        ).show();
      }
    }
  }
}
