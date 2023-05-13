import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/Auth/verify_reset_password_screen.dart';
import 'package:flutter_bootcamp/screens/widgets/app_logo.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/Auth/resetpassword_controller.dart';
import '../../core/functions/textformfields_validators.dart';
import '../../enums/status_request.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import '../widgets/header.dart';

var formKey = GlobalKey<FormState>();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final args =
        ModalRoute.of(context)!.settings.arguments as OTPverificationArguments;
    String email = args.email;
    ResetPasswordController resetpasswordcontroller =
        Get.put(ResetPasswordController(key: formKey));

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ResetPasswordController>(builder: (controller) {
          return controller.statusrequest == StatusRequest.loading
              ? SizedBox(
                  height: height - 30,
                  child: Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 150, height: 150),
                  ))
              : Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Header(
                            title: "Réinitialiser le mot de passe",
                          ),
                          const SizedBox(height: 110),
                          const Center(child: AppLogo(scale: 2.1)),
                          const SizedBox(height: 60),
                          const Text(
                            "Réinitialiser votre mot de passe : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: "Kanit",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Veuillez entrer votre nouveau mot de passe et le confirmer : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                height: 1.44,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 45),
                          CustomTextFormField(
                              hinttext: "Enter votre mot de passe",
                              labeltext: "Mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: passcontroller,
                              validator: passvalidator,
                              isObscure: true),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                              hinttext: "Confirmez votre mot de passe",
                              labeltext: "Confirmation de  mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: repasscontroller,
                              validator: (value) =>
                                  repassvalidator(value, passcontroller.text),
                              isObscure: true),
                          const SizedBox(height: 30),
                          Center(
                              child: CustomButton(
                                  text: "Valider",
                                  onpressed: () {
                                    resetpasswordcontroller.reset(
                                        email, passcontroller.text, context);
                                  })),
                          const SizedBox(
                            height: 60,
                          ),
                          const Center(child: CopyrightText()),
                        ],
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
