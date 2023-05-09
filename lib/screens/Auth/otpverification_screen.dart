import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../widgets/app_logo.dart';
import 'widgets/copyright_text.dart';
import 'widgets/header.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OTPverificationArguments;
    String email = args.email;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(
                  title: "vérification OTP",
                ),
                const SizedBox(height: 130),
                const Center(child: AppLogo(scale: 2.1)),
                const SizedBox(height: 100),
                const Text(
                  "Vérifier le code : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: "Kanit",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Veuillez entrer le code envoyé à : \n $email",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontFamily: "os",
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      height: 1.44,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 35,
                ),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  showFieldAsBox: true,
                  focusedBorderColor: const Color(0xff52C560),
                  textStyle: TextStyle(color: Colors.black.withOpacity(.8)),
                  onSubmit: (value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "resetpassword", (route) => false,arguments: OTPverificationArguments(email));
                  },
                  cursorColor: Colors.grey,
                ),
                const SizedBox(height: 200),
                const Center(child: CopyrightText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPverificationArguments {
  final String email;

  OTPverificationArguments(this.email);
}
