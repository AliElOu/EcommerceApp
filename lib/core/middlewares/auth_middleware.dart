import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {

  SettingServices c = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(c.prefs.getString("email") != null) return const RouteSettings(name: "/home");
  }

}