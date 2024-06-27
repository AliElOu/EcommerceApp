import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/signup_data.dart';
import '../../views/Auth/verify_reset_password_screen.dart';

class SignUpController extends GetxController {
  SignUpController(
      {required this.email,
      required this.pass,
      required this.adresse,
      required this.username,
      required this.phone,
      required this.key});

  Crud crud = Crud();
  late SignUpData signupdata = SignUpData(crud);

  StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  late TextEditingController email;
  late TextEditingController pass;
  late TextEditingController username;
  late TextEditingController adresse;
  late TextEditingController phone;

  register(context) async {
    if (key.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await signupdata.postData(
          username.text, pass.text, email.text, adresse.text, phone.text);
      statusrequest = handlingData(response);

      if (statusrequest == StatusRequest.succes) {
        update();
        Get.toNamed("/verifyaccount",
            arguments: OTPverificationArguments(email.text));
      } else if (statusrequest == StatusRequest.failure) {
        update();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Failed register',
          desc: 'Email or username already exists.',
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }
}
