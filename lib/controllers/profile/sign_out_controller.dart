import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bootcamp/controllers/choose_language_controller.dart';
import 'package:flutter_bootcamp/core/functions/get_token.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

SettingServices c = Get.find();
ChooseLanguageController c2 = Get.find();

class SignOutController extends GetxController {
  removeToken() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await collectionRef
        .where("email", isEqualTo: c.prefs.getString("email"))
        .limit(1)
        .get();

    print(c.prefs.getString("email"));
    print(querySnapshot.docs);
    DocumentSnapshot userDoc = querySnapshot.docs[0];
    List<dynamic> tokens = List.from(userDoc["devices"]);
    String myToken = await getDeviceToken();

    if (tokens.contains(myToken)) {
      tokens.remove(myToken);
      await collectionRef.doc(userDoc.id).update(
        {
          'devices': tokens,
        },
      );
    }
  }

  signOut() async {
    await removeToken();
    c.prefs.clear();
    c.prefs.setInt("onboardingPassed", 1);
    c.prefs.setString("lang", c2.intialLang!.languageCode);
    Get.offAllNamed('/login');
  }
}
