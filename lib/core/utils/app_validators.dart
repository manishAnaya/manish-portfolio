class AppValidator {
  /// Validates email format using regex.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Email regex pattern
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // Valid email
  }

  /// Validates password based on minimum length and optional complexity.
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    return null; // Valid password
  }

  /// Validates phone number based on length and format.
  static String? validatePhoneNumber(String? value, {int minLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Basic phone number pattern
    final RegExp phoneRegex = RegExp(r'^[0-9]{10,}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    if (value.length < minLength) {
      return 'Phone number must be at least $minLength digits long';
    }

    return null; // Valid phone number
  }

  /// Validates if a required field is not empty.
  static String? validateRequiredField(
    String? value, {
    String fieldName = 'Field',
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null; // Valid non-empty field
  }

  /// Validates if a numeric field contains valid numbers.
  static String? validateNumeric(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    // Numeric regex pattern
    final RegExp numericRegex = RegExp(r'^\d+$');

    if (!numericRegex.hasMatch(value)) {
      return '$fieldName must contain only numbers';
    }

    return null; // Valid numeric input
  }

  /// Validates if both passwords (for confirmation) match.
  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null; // Valid match
  }

  /// Validates an address or general text field with minimum length.
  static String? validateTextField(
    String? value, {
    int minLength = 3,
    String fieldName = 'Field',
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters long';
    }

    return null; // Valid text field
  }

  /// Validates if a URL is in the correct format.
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }

    // URL regex pattern
    final RegExp urlRegex = RegExp(
      r'^(https?:\/\/)?([\w-]+(\.[\w-]+)+)([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?$',
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null; // Valid URL
  }
}
