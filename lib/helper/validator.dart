class Validator {
  static bool checkName(String x) {
    bool containsLetters = false;
    containsLetters = RegExp(r"^(?=.*?[أ-ي])").hasMatch(x) ||
        RegExp(r"^(?=.*?[A-z])").hasMatch(x);
    return containsLetters;
  }

  static bool checkNumber(String x) {
    try {
      double.parse(x.toString());
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool checkEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool checkPassword(String password) {
    return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*-~]).{8,}$')
            .hasMatch(password) &&
        !password.contains(" ");
  }

  static bool checkPhoneNumber(String phone) {
    try {
      int.parse(phone);
      return phone.length <= 9;
    } catch (e) {
      return false;
    }
  }
}
