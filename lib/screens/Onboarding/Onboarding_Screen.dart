import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/api_links.dart';
import 'package:flutter_bootcamp/constants.dart';
import 'package:flutter_bootcamp/main.dart';
import 'package:get/get.dart';
import '../widgets/app_logo.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 60),
            child: Column(
              children: [
                const AppLogo(scale: 3.5),
                const SizedBox(
                  height: 50,
                ),
                Image.network(
                  "${AppLinks.images}splash_ilustration.png",
                  scale: 4,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Trouvez votre solution médicale",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: "os",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Bienvenue sur notre application de pharmacie, n'hésitez pas à choisir votre bon médicament.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "os",
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.5),
                    height: 2.5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(55, 60, 55, 0),
                  height: 110,
                  width: 400,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: PrimaryColor,
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      prefs.setInt("onboardingPassed", 1);
                      Get.offAllNamed(
                          '/login');
                    },
                    child: const Text(
                      'Commencer',
                      style: TextStyle(
                        fontFamily: "os",
                        fontSize: 16,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
