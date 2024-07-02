import 'package:firebase_messaging/firebase_messaging.dart';

getDeviceToken() async {
  String? myToken = await FirebaseMessaging.instance.getToken();
  return myToken;
}
