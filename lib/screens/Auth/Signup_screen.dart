import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/widgets/app_logo.dart';

import '../../core/functions/textformfields_validators.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import 'widgets/header.dart';

var kk = GlobalKey<FormState>();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();
final emailcontroller = TextEditingController();
final usernamecontroller = TextEditingController();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: kk,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  const Header(
                    title: "Sign Up",
                  ),
                  Container(
                    height: 70,
                  ),
                  const AppLogo(
                    scale: 2.5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Complete your details or continue \n with social media',
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
                      hinttext: "Enter your username",
                      labeltext: "Username",
                      suffixicon: Icons.supervised_user_circle_outlined,
                      controller: usernamecontroller,
                      isObscure: false),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      hinttext: "Enter your email",
                      labeltext: "Email",
                      suffixicon: Icons.mail_outline,
                      controller: emailcontroller,
                      validator: emailvalidator,
                      isObscure: false),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      hinttext: "Enter your password",
                      labeltext: "Password",
                      suffixicon: Icons.lock_outline,
                      controller: passcontroller,
                      validator: passvalidator,
                      isObscure: true),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      hinttext: "Re-enter your password",
                      labeltext: "Confirm Password",
                      suffixicon: Icons.lock_outline,
                      controller: repasscontroller,
                      validator: (value) => repassvalidator(value, passcontroller.text),
                      isObscure: true),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: "Continue",
                      onpressed: () {
                        register(context);
                      }),
                  const SizedBox(
                    height: 40,
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

  
}


void register(context) {
    if (kk.currentState!.validate()) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Registered Successfully',
        desc: 'Go back to the login page and enter your login informations.',
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
  }




