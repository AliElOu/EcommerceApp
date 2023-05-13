import 'package:awesome_dialog/awesome_dialog.dart';
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

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    SignUpController signupcontroller = Get.put(SignUpController(
        email: emailcontroller,
        pass: passcontroller,
        username: usernamecontroller,
        key: kk));
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpController>(builder: (controller) {
          return controller.statusrequest == StatusRequest.loading
              ? SizedBox(
                  height: height - 30,
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
                              validator: (value) =>
                                  repassvalidator(value, passcontroller.text),
                              isObscure: true),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              text: "Continue",
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
