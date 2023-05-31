import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/screens/widgets/app_logo.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/Auth/signup_controller.dart';
import '../../core/functions/textformfields_validators.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import '../widgets/header.dart';

var kk = GlobalKey<FormState>();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();
final emailcontroller = TextEditingController();
final usernamecontroller = TextEditingController();
final phonecontroller = TextEditingController();
final adressecontroller = TextEditingController();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    SignUpController signupcontroller = Get.put(SignUpController(
        email: emailcontroller,
        pass: passcontroller,
        username: usernamecontroller,
        adresse: adressecontroller,
        phone: phonecontroller,
        key: kk));
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpController>(builder: (controller) {
          return controller.statusrequest == StatusRequest.loading
              ? SizedBox(
                  height: height - 15,
                  child: Center(
                    child: Lottie.asset("assets/lottie/loading.json",
                        width: 150, height: 150),
                  ))
              : Form(
                  key: kk,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        children: [
                          const Header(
                            title: "S'inscrire",
                          ),
                          const SizedBox(height: 20),
                          const AppLogo(
                            scale: 2.5,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Complétez les champs avec vos \n informations personnels',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "os",
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              height: 1.44,
                            ),
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          CustomTextFormField(
                              hinttext: "Entrer votre Nom d'utilisateur",
                              labeltext: "Nom d'utilisateur",
                              suffixicon: Icons.supervised_user_circle_outlined,
                              controller: usernamecontroller,
                              validator: usernamevalidator,
                              keyboardtype: TextInputType.name,
                              isObscure: false),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              hinttext: "Entrer votre email",
                              labeltext: "Email",
                              suffixicon: Icons.mail_outline,
                              controller: emailcontroller,
                              validator: emailvalidator,
                              keyboardtype: TextInputType.emailAddress,
                              isObscure: false),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              hinttext: "Entrer votre numéro de téléphone",
                              labeltext: "Numéro de téléphone",
                              suffixicon: Icons.phone_android_rounded,
                              controller: phonecontroller,
                              validator: phonevalidator,
                              keyboardtype: TextInputType.number,
                              isObscure: false),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              hinttext: "Entrer votre adresse de résidence",
                              labeltext: "Adresse",
                              suffixicon: Icons.location_on_rounded,
                              controller: adressecontroller,
                              validator: adressevalidator,
                              keyboardtype: TextInputType.streetAddress,
                              isObscure: false),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              hinttext: "Enter votre mot de passe",
                              labeltext: "Mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: passcontroller,
                              validator: passvalidator,
                              keyboardtype: TextInputType.visiblePassword,
                              isObscure: true),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                              hinttext: "Confirmez votre mot de passe",
                              labeltext: "Confirmez le mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: repasscontroller,
                              keyboardtype: TextInputType.visiblePassword,
                              validator: (value) =>
                                  repassvalidator(value, passcontroller.text),
                              isObscure: true),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              text: "Continuer",
                              onpressed: () {
                                signupcontroller.register(context);
                              }),
                          const SizedBox(
                            height: 40,
                          ),
                          const CopyrightText(),
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
