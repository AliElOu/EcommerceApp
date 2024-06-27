import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

class ChooseLanguageMiddleWare extends GetMiddleware {

  SettingServices c = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(c.prefs.getString("lang") != null) return const RouteSettings(name: "/onboarding");
  }

}