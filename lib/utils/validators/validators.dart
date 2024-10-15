class Validators {
  static final RegExp _nameRegExp = RegExp(r'^[A-za-z- ]+$');

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _phoneRegExp = RegExp(
    r'^\+?[0-9]{3}-?[0-9]{6,12}$',
  );

  static final RegExp _passwordRegExp = RegExp(
    // r"""^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@()$%^&*=_{}[\]:;\"'|\\<>,.\/~`±§+-]).{8,30}$""",
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,30}$',
  );

  static final RegExp _urlRegExp = RegExp(
    r'^(.*?)((?:https?:\/\/|www\.)[^\s/$.?#].[^\s]*)',
  );

  static bool isValidName(String name) {
    return _nameRegExp.hasMatch(name);
  }

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phone) {
    return _phoneRegExp.hasMatch(phone);
  }

  static bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static bool isValidUrl(String text) {
    return _urlRegExp.hasMatch(text);
  }
}
