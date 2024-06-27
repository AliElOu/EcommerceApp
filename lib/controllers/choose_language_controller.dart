import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

SettingServices c = Get.find();

class ChooseLanguageController extends GetxController {

  Locale? intialLang = c.prefs.getString("lang") == null ? Get.deviceLocale : Locale(c.prefs.getString("lang")!);
  void changeLang(String codeLang) {
    Locale currentLang = Locale(codeLang);
    c.prefs.setString("lang", codeLang);
    Get.updateLocale(currentLang);
  }
}
