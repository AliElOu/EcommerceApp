import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/main.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

class OnboardingMiddleWare extends GetMiddleware {

  SettingServices c = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(c.prefs.getInt("onboardingPassed") != null) return const RouteSettings(name: "/login");
  }
}