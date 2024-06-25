import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/constants.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../enums/menu_state.dart';

class CustomNavbar extends StatelessWidget {
  final MenuState currentPage;
  const CustomNavbar({
    super.key,
    required this.currentPage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                icon: currentPage == MenuState.home
                    ? SvgPicture.asset(
                        'assets/icons/shopicon.svg',
                        color: PrimaryColor,
                      )
                    : SvgPicture.asset(
                        'assets/icons/shopicon.svg',
                        color: Colors.grey,
                      ),
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              if (currentPage == MenuState.home)
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PrimaryColor,
                  ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed("/favorits");
                },
                icon: currentPage == MenuState.favorite
                    ? SvgPicture.asset(
                        "assets/icons/hearticon.svg",
                        color: PrimaryColor,
                      )
                    : SvgPicture.asset(
                        "assets/icons/hearticon.svg",
                      ),
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              if (currentPage == MenuState.favorite)
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PrimaryColor,
                  ),
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed("/profile");
                },
                icon: currentPage == MenuState.profile
                    ? SvgPicture.asset(
                        "assets/icons/usericon.svg",
                        color: PrimaryColor,
                      )
                    : SvgPicture.asset("assets/icons/usericon.svg"),
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              if (currentPage == MenuState.profile)
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: PrimaryColor,
                  ),
                )
            ],
          ),
        ]),
      ),
    );
  }
}
