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

    //final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value.length < 6) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
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
}
