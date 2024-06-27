import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/views/Auth/widgets/copyright_text.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/Auth/verify_reset_password_controller.dart';
import '../../enums/status_request.dart';
import '../widgets/app_logo.dart';
import '../widgets/header.dart';

class VerifyResetPasswordScreen extends StatelessWidget {
  const VerifyResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final args =
        ModalRoute.of(context)!.settings.arguments as OTPverificationArguments;
    String email = args.email;
    VerifyResetPasswordController verifyresetpasswordcontroller =
        Get.put(VerifyResetPasswordController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<VerifyResetPasswordController>(builder: (controller) {
          return controller.statusrequest == StatusRequest.loading
              ? SizedBox(
                  height: height - 30,
                  child: Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 150, height: 150),
                  ))
              : SingleChildScrollView(
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
                          focusedBorderColor: AppColors.PrimaryColor,
                          textStyle:
                              TextStyle(color: Colors.black.withOpacity(.8)),
                          onSubmit: (value) {
                            verifyresetpasswordcontroller.postData(
                                email, value, context);
                          },
                          cursorColor: Colors.grey,
                        ),
                        const SizedBox(height: 200),
                        const Center(child: CopyrightText()),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

class OTPverificationArguments {
  final String email;

  OTPverificationArguments(this.email);
}
