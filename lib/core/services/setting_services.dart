import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingServices extends GetxService {
  late SharedPreferences prefs;

  Future<SettingServices> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }
}
