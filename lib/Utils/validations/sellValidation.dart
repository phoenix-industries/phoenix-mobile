class Sellvalidation {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please,Enter The Product Title ';
    }
    return null;
  }

  static String? validateDescraption(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please,Enter The Product Descraption';
    }
    return null;
  }

  static String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please,Enter Full Location';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please,Enter The price';
    }
    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid number';
    }

    if (price <= 0) {
      return 'Price must be greater than 0';
    }
    return null;
  }
}
