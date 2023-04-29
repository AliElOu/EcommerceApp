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
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap:() {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Kanit",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
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
                  SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    validator:(value) {
                      final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
       if(value.isEmpty){
        return "*Champ Obligatoire!";
      }
      if(!emailValid){
        return "*Email non valid!";
      }
     
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                      labelText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: 'os',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Enter your email",
                      labelStyle: TextStyle(
                        fontFamily: 'os',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Icon(Icons.mail_outline),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    autofocus: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  passwordvisibility(),
                  SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
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
                      Text(
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
                  SizedBox(
                    height: 37,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(209, 255, 255, 255),
                      backgroundColor: Color(0xffF77546),
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 115,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed:() => login(context),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "os",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 63,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        child: SvgPicture.asset("assets/icons/google.svg"),
                        padding: EdgeInsets.all(11),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        child: SvgPicture.asset("assets/icons/facebook.svg"),
                        padding: EdgeInsets.all(11),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEEEFF1),
                          shape: BoxShape.circle,
                        ),
                        width: 37,
                        height: 37,
                        child: SvgPicture.asset("assets/icons/twitter.svg"),
                        padding: EdgeInsets.all(11),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
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
                        child: Text(
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
    print(ischecked);
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
    return  TextFormField(
                    validator: (value) {
                    
                                 if(value!.isEmpty){
                                  return "*Champ Obligatoire!";
                                       }
                                 },
                    obscureText: isvisible,
                    keyboardType: TextInputType.visiblePassword,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      labelStyle: TextStyle(                  
                        fontFamily: 'os',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'os',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: Padding(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent, 
                          hoverColor: Colors.transparent, 
                          onPressed: (){
                          isvisible = !isvisible;
                          setState(() {
                            
                          });
                        },
                         icon: Icon( isvisible ? Icons.visibility : Icons.visibility_off)),
                        padding: EdgeInsets.symmetric(horizontal: 13),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  )
    ;
  }
}