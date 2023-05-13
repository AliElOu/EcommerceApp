import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/forgetpassword_data.dart';
import '../../screens/Auth/verify_reset_password_screen.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController({required this.email, required this.key});

  Crud crud = Crud();
  late ForgetPasswordData forgetpassworddata = ForgetPasswordData(crud);

   StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  late TextEditingController email;

  verify(context) async {
    if (key.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await forgetpassworddata.postData(email.text);
      statusrequest = handlingData(response);

      if (statusrequest == StatusRequest.succes) {
        update();
        Navigator.pushNamed(context, "verifyresetpassword",
            arguments: OTPverificationArguments(email.text));
      } else if (statusrequest == StatusRequest.failure) {
        update();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Erreur',
          desc: "Votre adresse email n'est pas valide!",
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }
}


