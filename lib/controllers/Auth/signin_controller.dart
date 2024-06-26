import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/core/functions/get_token.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../remote/Auth/signin_data.dart';
import '../../views/Auth/verify_reset_password_screen.dart';

class SignInController extends GetxController {
  SignInController(
      {required this.email, required this.pass, required this.key});

  SettingServices c = Get.find();

  Crud crud = Crud();
  late SignInData signindata = SignInData(crud);

  StatusRequest? statusrequest;

  late GlobalKey<FormState> key;

  late TextEditingController email;
  late TextEditingController pass;

  List data = [];

  bool isCheked = false;

  void changeRememberMe() {
    isCheked = !isCheked;
    update(["rememberme"]);
  }

  saveToken() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await collectionRef
        .where("email", isEqualTo: email.text)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs[0];
      List<dynamic> tokens = List.from(userDoc["devices"]);
      String newToken = await getDeviceToken();

      if (!tokens.contains(newToken)) {
        tokens.add(newToken);
        await collectionRef.doc(userDoc.id).update(
          {
            'devices': tokens,
          },
        );
      }
    } else {
      collectionRef.add(
        {
          'email': email.text,
          'devices': [await getDeviceToken()],
        },
      );
    }
  }

  login(context) async {
    if (key.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await signindata.postData(pass.text, email.text);
      statusrequest = handlingData(response);

      if (statusrequest == StatusRequest.succes) {
        data.clear();
        data.addAll(response['data']);
        if (data[0]['is_verified'] == "1") {
          c.prefs.setString("id", "${data[0]["id_user"]}");
          c.prefs.setString("username", "${data[0]["username"]}");
          c.prefs.setString("email", "${data[0]["email"]}");
          c.prefs.setString("adresse", "${data[0]["adresse"]}");
          c.prefs.setString("phone", "${data[0]["phone"]}");
          c.prefs.setString("pass", "${data[0]["password"]}");
          c.prefs.setString("is_verified", "${data[0]["is_verified"]}");
          data.clear();
          await saveToken();
          update();
          Get.offAllNamed("/home");
        } else {
          Get.to("/verifyaccount",
              arguments: OTPverificationArguments(email.text));
        }
      } else if (statusrequest == StatusRequest.failure) {
        update();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Erreur',
          desc: 'Votre adresse email ou mot de passe est incorrecte!',
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }
}
