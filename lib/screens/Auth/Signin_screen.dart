import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/signin_controller.dart';
import 'package:get/get.dart';

import '../../core/functions/textformfields_validators.dart';
import '../widgets/app_logo.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import 'widgets/header.dart';

final emailcontroller = TextEditingController();
final passcontroller = TextEditingController();
var formKey = GlobalKey<FormState>();
bool isvisible = true;

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    isObscure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(hinttext: "Entrer votre mot de passe", labeltext: "Mot de passe", suffixicon: Icons.lock, controller: passcontroller, isObscure: true,validator: passvalidator,),
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
                            }
                          ),
                          const Text(
                            'Remember me',
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
                          Navigator.pushNamed(context, "forgetpassword");
                        },
                        child: const Text(
                          "Forgot password",
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
                      text: "Continue",
                      onpressed: () {
                        login(context);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'D\'ont have an account?',
                        style: TextStyle(
                          fontFamily: 'op',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(
                            fontFamily: 'op',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff52C560),
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
      ),
    );
  }

  void login(context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    }
  }
}

