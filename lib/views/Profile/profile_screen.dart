import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/choose_language_controller.dart';
import 'package:flutter_bootcamp/enums/menu_state.dart';
import 'package:flutter_bootcamp/views/Profile/widgets/custom_circle_avatar_widget.dart';
import 'package:flutter_bootcamp/views/Profile/widgets/profile_custom_button_widget.dart';
import 'package:flutter_bootcamp/views/Profile/widgets/user_information_widget.dart';
import 'package:flutter_bootcamp/views/widgets/custom_navbar.dart';
import 'package:flutter_bootcamp/views/widgets/header.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingServices c = Get.find();
    ChooseLanguageController c2 = Get.find();
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Header(title: "Profile")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: CustomCircleAvatar()),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInformationWidget(
                    title: "Nom d'utilisateur",
                    info: 'username',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserInformationWidget(
                    title: "Email",
                    info: 'email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserInformationWidget(
                    title: "Numéro de téléphone",
                    info: 'phone',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserInformationWidget(
                    title: "Adresse",
                    info: 'adresse',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ProfileCustomButtonWidget(
              text: "Changer le mot de passe",
              icon: Icons.password_rounded,
              press: (() {
                Get.toNamed('/changepass');
              }),
              horiz: 35,
            ),
            ProfileCustomButtonWidget(
              text: "Commandes historique",
              icon: Icons.history_rounded,
              press: (() {
                Get.toNamed('/history');
              }),
              horiz: 35,
            ),
            ProfileCustomButtonWidget(
              text: "Se déconnecter",
              icon: Icons.output_outlined,
              press: (() {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title: 'Alerte',
                  desc: 'êtes-vous sûre de se déconnecter ?',
                  btnCancelOnPress: () {},
                  btnOkText: "Oui",
                  btnCancelText: "Non",
                  btnOkColor: Colors.green,
                  btnCancelColor: Colors.blue,
                  btnOkOnPress: () {
                    c.prefs.clear();
                    c.prefs.setInt("onboardingPassed", 1);
                    c.prefs.setString("lang", c2.intialLang!.languageCode);
                    Get.offAllNamed('/login');
                  },
                ).show();
              }),
              horiz: 70,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavbar(currentPage: MenuState.profile),
    );
  }
}
