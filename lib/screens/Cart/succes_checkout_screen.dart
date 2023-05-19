import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/Auth/widgets/custom_button.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 100,
              ),
              Image.asset("assets/images/order_success_ilustration.png"),
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
                height: 80,
              ),
              CustomButton(
                text: "Back to home",
                onpressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, "home", (route) => false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
