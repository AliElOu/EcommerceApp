import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/main.dart';
import 'package:get/get.dart';

class OnboardingMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if(prefs.getInt("onboardingPassed") != null) return const RouteSettings(name: "/login");
  }
}