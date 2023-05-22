import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/profile/change_pass_controller.dart';
import '../../core/functions/textformfields_validators.dart';
import '../../enums/status_request.dart';

import '../../main.dart';
import '../Auth/widgets/copyright_text.dart';
import '../Auth/widgets/custom_button.dart';
import '../Auth/widgets/custom_textformfield.dart';
import '../widgets/header.dart';

var formKey = GlobalKey<FormState>();
final actuelpasscontroller = TextEditingController();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
  
    ChangePasswordController changepasswordcontroller =
        Get.put(ChangePasswordController(key: formKey));

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ChangePasswordController>(builder: (controller) {
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
                            title: "Changer le mot de passe",
                          ),
                          const SizedBox(height: 120),
                          const Text(
                            "Changer votre mot de passe : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: "Kanit",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "Veuillez entrer votre mot de passe actuel et votre nouveau mot de passe : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "os",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                height: 1.44,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 70),
                          CustomTextFormField(
                              hinttext: "Enter votre mot de passe actuel",
                              labeltext: "Mot de passe actuel",
                              suffixicon: Icons.lock_outline,
                              controller: actuelpasscontroller,
                              keyboardtype: TextInputType.visiblePassword,
                              validator: changepassvalidator,
                              isObscure: true),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                              hinttext: "Enter votre mot de passe",
                              labeltext: "Mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: passcontroller,
                              validator: changepassvalidator2,
                              keyboardtype: TextInputType.visiblePassword,
                              isObscure: true),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                              hinttext: "Confirmez votre mot de passe",
                              labeltext: "Confirmation de  mot de passe",
                              suffixicon: Icons.lock_outline,
                              controller: repasscontroller,
                              keyboardtype: TextInputType.visiblePassword,
                              validator: (value) =>
                                  repassvalidator(value, passcontroller.text),
                              isObscure: true),
                          const SizedBox(height: 30),
                          Center(
                              child: CustomButton(
                                  text: "Valider",
                                  onpressed: () {
                                    changepasswordcontroller.reset(
                                        prefs.getString("email"), passcontroller.text, context);
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
