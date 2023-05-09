import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/Auth/otpverification_screen.dart';
import 'package:flutter_bootcamp/screens/widgets/app_logo.dart';

import '../../core/functions/textformfields_validators.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import 'widgets/header.dart';

var formKey = GlobalKey<FormState>();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OTPverificationArguments;
    String email = args.email;
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                      validator: (value) => repassvalidator(
                          value, passcontroller.text),
                      isObscure: true),
                  const SizedBox(height: 30),
                  Center(
                      child: CustomButton(text: "Valider", onpressed: () {ResetPass(context,email);})),
                  const SizedBox(
                    height: 60,
                  ),
                  const Center(child: CopyrightText()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


void ResetPass(context,String email) {
    if (formKey.currentState!.validate()) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Succes',
        desc: 'Votre mot de passe est réinitialisé avec succes.',
        btnOkOnPress: () {
          Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
        },
      ).show();
    }
  }