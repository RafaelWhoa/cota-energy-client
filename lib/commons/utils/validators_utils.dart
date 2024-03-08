
class ValidatorsUtils{
  static bool emailValidator(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool comfirmationPasswordValidator(String password, String comfirmationPassword) {
    return password == comfirmationPassword;
  }
}
