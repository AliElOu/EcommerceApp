import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/Auth/forgetpassword_controller.dart';
import '../../core/functions/textformfields_validators.dart';
import '../../enums/status_request.dart';
import '../widgets/app_logo.dart';
import 'widgets/copyright_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_textformfield.dart';
import '../widgets/header.dart';

var formKey = GlobalKey<FormState>();
final emailcontroller = TextEditingController();

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    ForgetPasswordController forgetpasswordcontroller =
        Get.put(ForgetPasswordController(key: formKey, email: emailcontroller));

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ForgetPasswordController>(builder: (controller) {
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
                            title: "Mot de passe oublié",
                          ),
                          const SizedBox(height: 120),
                          const Center(child: AppLogo(scale: 2.1)),
                          const SizedBox(height: 100),
                          const Text(
                            "Vérification d'adresse Email : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: "Kanit",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Veuillez entrer l'adresse email de votre compte : ",
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
                              hinttext: "Entrer votre email",
                              labeltext: "Email",
                              suffixicon: Icons.mail_outline,
                              controller: emailcontroller,
                              validator: emailvalidator,
                              keyboardtype: TextInputType.emailAddress,
                              isObscure: false),
                          const SizedBox(height: 30),
                          Center(
                              child: CustomButton(
                                  text: "Continuer",
                                  onpressed: () {
                                    forgetpasswordcontroller.verify(context);
                                  })),
                          const SizedBox(
                            height: 110,
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
