class Validators {
  static String? validatePassword(String? password, String? username) {
    if (password == null) return Validators.required("Password", password);
    RegExp oneUppercaseLetter = RegExp(r"[A-Z0-9]+");
    RegExp oneLowercaseLetter = RegExp(r"[a-z0-9]+");
    RegExp minLength = RegExp(r".{8,}");
    RegExp specialChar = RegExp(r"[@!#%&()^~{}]{2,}");

    if (!oneUppercaseLetter.hasMatch(password)) {
      return "One uppercase letter";
    }

    if (!oneLowercaseLetter.hasMatch(password)) {
      return "One lowercase letter";
    }
    if (!minLength.hasMatch(password)) {
      return "Minimum password length of 8 characters";
    }
    if (!specialChar.hasMatch(password)) {
      return "Two special characters";
    }

    if (username != null) {
      if (password.contains(username)) {
        return "Password should not contain the username";
      }
    }

    return null;
  }

  static String? required(String fieldName, String? value) {
    if (value == null || (value.isEmpty)) return "$fieldName est obligatoire";
    return null;
  }
}
