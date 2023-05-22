import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../../main.dart';

String? emailvalidator(value) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);
  if (value.isEmpty) {
    return "*Champ Obligatoire!";
  }
  if (!emailValid) {
    return "*Email non valide!";
  }
  return null;
}


String? passvalidator(String? value) {
  if (value!.isEmpty) {
    return "*Champ Obligatoire!";
  }
  if(value.length < 8){
    return "*Entrer plus de 8 caratères!";
  }
  return null;
}

String? repassvalidator(value,String pass) {
  if (value!.isEmpty) {
    return "*Champ Obligatoire!";
  }
  if (value != pass) {
    return "*la confirmation de mot de passe est incorrecte!";
  }
  return null;
}

String? changepassvalidator(value) {
  String pass = md5.convert(utf8.encode(value)).toString();
   if (pass != prefs.getString("pass")! && pass != "d41d8cd98f00b204e9800998ecf8427e") {
    return "*mot de passe incorrecte!";
  }
  return passvalidator(value);
}

String? changepassvalidator2(value) {
  String pass = md5.convert(utf8.encode(value)).toString();
   if (pass == prefs.getString("pass")!) {
    return "*Ce mot de passe est votre mot de passe actuel!";
  }
  return passvalidator(value);
}



String? usernamevalidator(String? value) {
  if (value!.isEmpty) {
    return "*Champ Obligatoire!";
  }
  if(value.length < 4){
    return "*Nom d'utiliosateur est non valide!";
  }
  return null;
}



String? adressevalidator(value) {
  if (value!.isEmpty) {
    return "*Champ Obligatoire!";
  }
  return null;
}


String? phonevalidator(String? value) {
  final bool phoneValid = RegExp(
          r"^[0-9]*$")
      .hasMatch(value!);
  if (value.isEmpty) {
    return "*Champ Obligatoire!";
  }
  if(!phoneValid){
    return "*Ce champ n'accepte que des numéros!";
  }
  if(value.length < 10){
    return "*numéro de téléphone est non valide!";
  }
  return null;
}