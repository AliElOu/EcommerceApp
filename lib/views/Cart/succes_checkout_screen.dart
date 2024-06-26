import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/constants/api_links.dart';
import 'package:flutter_bootcamp/views/Auth/widgets/custom_button.dart';
import 'package:get/get.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  const SuccessCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                child: Image.network("${AppLinks.images}logo.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.network("${AppLinks.images}order_success_ilustration.png"),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Yeay, ta commande est passé avec succes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "os",
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Vous pouvez voir ses details à votre historique de commandes",
                style: TextStyle(
                  color: Color.fromARGB(255, 133, 133, 133),
                  fontSize: 17,
                  fontFamily: "os",
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: "Retour à l'accueil",
                  onpressed: () => Get.offAll(
                        "/home",
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
