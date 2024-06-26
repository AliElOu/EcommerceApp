import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData? suffixicon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardtype;



  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.labeltext,
    this.suffixicon, required this.controller,  this.validator, required this.isObscure, required this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        labelText: labeltext,
        hintStyle: const TextStyle(
          fontFamily: 'os',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        hintText: hinttext,
        labelStyle: const TextStyle(
          fontFamily: 'os',
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        
        suffixIcon:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Icon(suffixicon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      autofocus: false,
    );
  }
}