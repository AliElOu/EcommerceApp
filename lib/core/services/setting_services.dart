import 'package:flutter_bootcamp/firebase_options.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class SettingServices extends GetxService {
  late SharedPreferences prefs;

  Future<SettingServices> init() async {
    prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return this;
  }
}
