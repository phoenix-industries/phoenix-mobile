class Registervaldation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please,Enter your name';
    }
    if (value.length > 3) {
      return 'Please, Enter full name';
    }
    return null;
  }

  static String? validateEmai(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';

    // Require: 1 uppercase, 1 lowercase, 1 digit, 1 special char, min length 8
    final pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Password must be at least 8 chars and include uppercase, lowercase, number, and special char';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length < 11) {
      return 'Enter valid phone number';
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Select your birth date';
    }
    return null;
  }
}
