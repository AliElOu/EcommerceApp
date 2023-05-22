import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/enums/menu_state.dart';
import 'package:flutter_bootcamp/screens/Profile/widgets/custom_circle_avatar_widget.dart';
import 'package:flutter_bootcamp/screens/Profile/widgets/profile_custom_button_widget.dart';
import 'package:flutter_bootcamp/screens/Profile/widgets/user_information_widget.dart';
import 'package:flutter_bootcamp/screens/widgets/custom_navbar.dart';
import 'package:flutter_bootcamp/screens/widgets/header.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
                Navigator.pushNamed(context, 'changepass');
              }),
              horiz: 35,
            ),
            ProfileCustomButtonWidget(
              text: "Commandes historique",
              icon: Icons.history_rounded,
              press: (() {
                Navigator.pushNamed(context, 'history');
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
                    prefs.clear();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('login', (route) => false);
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
