class Validation{
  static String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Postal code cannot be empty';
    }

    // General postal code validation regex
    if (!RegExp(r'^[a-zA-Z0-9\s\-]{3,10}$').hasMatch(value)) {
      return 'Please enter a valid postal code';
    }

    return null; // Return null if validation succeeds
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty';
    }

    // General address validation regex
    if (!RegExp(r"^[a-zA-Z0-9\s,.'-]{5,100}$").hasMatch(value)) {
      return 'Please enter a valid address';
    }

    return null; // Return null if validation succeeds
  }

  static   String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // Phone number validation (you can customize this regex based on your requirements)
    if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null; // Return null if validation succeeds
  }
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    // Name validation (only allows letters and spaces)
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null; // Return null if validation succeeds
  }
  static   String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Validate password complexity (e.g., length and character types)
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Additional custom checks (optional), e.g., character types
    if (!RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$')
        .hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    return null; // Return null if validation succeeds
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Comprehensive email validation regex pattern
    const String pattern = r'^[a-zA-Z0-9.!#$%&\*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if validation succeeds
  }
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    // Username validation: must include at least one letter, one digit, and one special character
    // Allowed special characters are: !@#\$&*~_
    const String pattern = r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#\$&*~_])[a-zA-Z\d!@#\$&*~_]{3,20}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Username must be 3-20 characters long, and include at least one letter, one digit, and one special character (!@#\$&*~_)';
    }
    return null; // Return null if validation succeeds
  }

}
