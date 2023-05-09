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


String? passvalidator(value) {
  if (value!.isEmpty) {
    return "*Champ Obligatoire!";
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