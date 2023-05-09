import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/app_logo.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  _Onboardingscreenstate createState() => _Onboardingscreenstate();
}

class _Onboardingscreenstate extends State<Onboardingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 60),
          child: Column(
            children: [
              const AppLogo(scale: 3.5),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/splash_ilustration.png",
                scale: 4,
              ),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Find your medical Solution",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: "os",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Welcome to our pharmacy app  \n feel free on choosing your right medecine.",
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
                    backgroundColor: const Color(0xff52C560),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'login', (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    'Get Started',
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
    );
  }
}


