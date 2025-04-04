//package:sample_project/dataValidator.dart

class DataValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty.';
    }
    if (!email.contains('@')) {
      return 'Invalid email format.';
    }
    return null; // Null means valid
  }

  String? validateAge(int age) {
    if (age < 0) {
      return 'Age cannot be negative.';
    }
    if (age > 150) {
      return 'Age is too high.';
    }
    return null;
  }

  String? validateStringLength(String input, int minLength, int maxLength){
    if (input.length < minLength) {
      return 'Input is too short.';
    }
    if (input.length > maxLength) {
      return 'Input is too long.';
    }
    return null;
  }
}