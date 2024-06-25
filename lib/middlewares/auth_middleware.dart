import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/main.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    if(prefs.getString("email") != null) return const RouteSettings(name: "/home");
  }

}