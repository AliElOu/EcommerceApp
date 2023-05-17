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
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  UserInformationWidget(
                    title: "Username",
                    info: 'username',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserInformationWidget(
                    title: "Email",
                    info: 'email',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ProfileCustomButtonWidget(
              text: "Changer mot de passe",
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
              text: "Log Out",
              icon: Icons.output_outlined,
              press: (() {
                prefs.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('login', (route) => false);
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
