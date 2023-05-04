// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var formKey = GlobalKey<FormState>();
bool ischecked = false;
bool isvisible = true;

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40),
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
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Kanit",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'Sign in with your mail and password \n or continue with social media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      wordSpacing: 0.3,
                      letterSpacing: 0.1,
                      fontSize: 14,
                      fontFamily: "os",
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      height: 1.42,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
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
                    keyboardType: TextInputType.emailAddress,
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
                  const passwordvisibility(),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          ChangeCheckBox(),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Forgot password",
                        style: TextStyle(
                          fontFamily: "os",
                          fontWeight: FontWeight.w600,
                          color: Color(0xffAEAEAE),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 37,
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
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed: () => login(context),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "os",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 63,
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
                        child: SvgPicture.asset("assets/icons/google.svg"),
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
                        child: SvgPicture.asset("assets/icons/facebook.svg"),
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
                        child: SvgPicture.asset("assets/icons/twitter.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'D\'ont have an account?',
                        style: TextStyle(
                          fontFamily: 'op',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(
                            fontFamily: 'op',
                            fontWeight: FontWeight.w500,
                            color: Color(0xffF08F65),
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, "Home", (route) => false);
    }
  }
}

class ChangeCheckBox extends StatefulWidget {
  const ChangeCheckBox({super.key});

  @override
  State<ChangeCheckBox> createState() => _ChangeCheckBoxState();
}

class _ChangeCheckBoxState extends State<ChangeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: ischecked,
      onChanged: chang,
    );
  }

  void chang(bool? a) {
    ischecked = a!;
    setState(() {});
  }
}

class passwordvisibility extends StatefulWidget {
  const passwordvisibility({super.key});

  @override
  State<passwordvisibility> createState() => _passwordvisiblityState();
}

class _passwordvisiblityState extends State<passwordvisibility> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "*Champ Obligatoire!";
        }
        return null;
      },
      obscureText: isvisible,
      keyboardType: TextInputType.visiblePassword,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                isvisible = !isvisible;
                setState(() {});
              },
              icon: Icon(isvisible ? Icons.visibility : Icons.visibility_off)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
