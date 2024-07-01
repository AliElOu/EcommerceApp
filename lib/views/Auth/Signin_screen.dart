import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:flutter_bootcamp/controllers/Auth/signin_controller.dart';
import 'package:flutter_bootcamp/core/functions/alert_exit_app.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/functions/textformfields_validators.dart';
import '../../enums/status_request.dart';
import '../widgets/app_logo.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import '../widgets/header.dart';

final emailcontroller = TextEditingController();
final passcontroller = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isvisible = true;

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    SignInController signincontroller = Get.put(SignInController(
        email: emailcontroller, pass: passcontroller, key: formKey));
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignInController>(builder: (controller) {
          return controller.statusrequest == StatusRequest.loading
              ? SizedBox(
                  height: height - 30,
                  child: Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 150, height: 150),
                  ))
              : WillPopScope(
                  onWillPop: () {
                    alertExitApp(context);
                    return Future(() => true);
                  },
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const Header(
                              title: "Connexion",
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            const AppLogo(
                              scale: 2.5,
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            const Text(
                              "Connectez-vous avec votre email et mot de passe et profitez de l'application ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                wordSpacing: 0.3,
                                letterSpacing: 0.1,
                                fontSize: 14,
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                height: 1.42,
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            CustomTextFormField(
                              hinttext: "Enter votre email",
                              labeltext: "Email",
                              suffixicon: Icons.mail_outline,
                              controller: emailcontroller,
                              validator: emailvalidator,
                              keyboardtype: TextInputType.emailAddress,
                              isObscure: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              hinttext: "Entrer votre mot de passe",
                              labeltext: "Mot de passe",
                              suffixicon: Icons.lock,
                              controller: passcontroller,
                              isObscure: true,
                              keyboardtype: TextInputType.visiblePassword,
                              validator: passvalidator,
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GetBuilder<SignInController>(
                                      id: "rememberme",
                                      builder: (controller) {
                                        return Checkbox(
                                          value: controller.isCheked,
                                          onChanged: (value) {
                                            controller.changeRememberMe();
                                          },
                                        );
                                      },
                                    ),
                                    const Text(
                                      'Se souvenir',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/forgetpassword");
                                  },
                                  child: const Text(
                                    "Mot de passe oublié",
                                    style: TextStyle(
                                      fontFamily: "os",
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffAEAEAE),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 37,
                            ),
                            CustomButton(
                                text: "Continuer",
                                onpressed: () {
                                  signincontroller.login(context);
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Vous n\'avez pas de compte?',
                                  style: TextStyle(
                                    fontFamily: 'op',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/register');
                                  },
                                  child: const Text(
                                    ' S\'enregistrer',
                                    style: TextStyle(
                                      fontFamily: 'op',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.PrimaryColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 55,
                            ),
                            const CopyrightText(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
