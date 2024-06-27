import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/controllers/choose_language_controller.dart';
import 'package:get/get.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseLanguageController chooselanguagecontroller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "choose".tr,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "os",
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                height: 35,
                color: AppColors.PrimaryColor,
                textColor: Colors.white,
                minWidth: 150,
                onPressed: () {
                  chooselanguagecontroller.changeLang("fr");
                  Get.toNamed("/onboarding");
                },
                child: Text("lang1".tr),
              ),
              MaterialButton(
                height: 35,
                minWidth: 150,
                color: AppColors.PrimaryColor,
                textColor: Colors.white,
                onPressed: () {
                  chooselanguagecontroller.changeLang("en");
                  Get.toNamed("/onboarding");
                },
                child: Text("lang2".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
