import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

alertExitApp(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: 'Alerte',
    desc: "Voulez-vous quitter l'application ?",
    btnCancelOnPress: () {},
    btnOkText: "Oui",
    btnCancelText: "Non",
    btnOkColor: Colors.green,
    btnCancelColor: Colors.blue,
    btnOkOnPress: () {
      exit(0);
    },
  ).show();
}
