class PasswordValidator {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$',
  );

  static bool validate(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (!_passwordRegExp.hasMatch(value)) {
      return 'Password must be 8-16 characters, include an uppercase letter, a lowercase letter, a number, and a special character';
    }
    return null;
  }

  static String? validateRepassword(String? value, String valueCompare) {
    if (value == null || value.isEmpty) {
      return 'Re-Password cannot be empty';
    }
    if (value != valueCompare) {
      return 'Passwords do not match';
    }
    return validatePassword(value);
  }
}
