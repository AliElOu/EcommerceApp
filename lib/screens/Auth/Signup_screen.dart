import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var kk = GlobalKey<FormState>();
final passcontroller = TextEditingController();
final repasscontroller = TextEditingController();
final emailcontroller = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 17,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                  ),
                  const Text(
                    'Register Account',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Kanit",
                      fontWeight: FontWeight.w600,
                    ),
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
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "*Champ Obligatoire!";
                      }
                      if (!emailValid) {
                        return "*Email non valid!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      labelText: 'Email',
                      hintStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Enter your email",
                      labelStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Icon(Icons.mail_outline),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Champ Obligatoire!";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Icon(Icons.lock_outline),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: repasscontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "*Champ Obligatoire!";
                      }
                      if (repasscontroller.text != passcontroller.text) {
                        return "*the confirmation of password is non correct!";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 20),
                      hintText: 'Re-enter your password',
                      labelText: 'Confirm Password',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Icon(Icons.lock_outline),
                      ),
                      labelStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'os',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(209, 255, 255, 255),
                      backgroundColor: const Color(0xffF77546),
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 115,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: register,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "os",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        padding: const EdgeInsets.all(11),
                        child: SvgPicture.asset("/icons/google.svg"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        padding: const EdgeInsets.all(11),
                        child: SvgPicture.asset("icons/facebook.svg"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        padding: const EdgeInsets.all(11),
                        child: SvgPicture.asset("icons/twitter.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'By continuing you confirm that you agree \n with our Term and condition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "os",
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (kk.currentState!.validate()) {}
  }
}
