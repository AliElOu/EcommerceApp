import 'package:get/get.dart';

class MyLocal extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "fr": {
          "choose": "Choisie une langue:",
          "lang1": "Fr",
          "lang2": "En",
        },
        "en": {
          "choose": "Choose a language:",
          "lang1": "Fr",
          "lang2": "En",
        }
      };
}
