import 'package:veegil/core/validators/error_messages.dart';
import 'package:veegil/core/validators/regex_patterns.dart';

class PasswordValidator {
  /// private
  PasswordValidator._();

  static String? validateStrong(String? input) {
    return RegexPattern.securePassword.hasMatch(input ?? '') ? null : ErrorMessage.enterStrongPassword;
  }

  static String? validate(String? input) {
    return RegexPattern.securePassword.hasMatch(input ?? '') ? null : ErrorMessage.enterValidPassword;
  }
}
