import 'package:veegil/core/validators/error_messages.dart';
import 'package:veegil/core/validators/regex_patterns.dart';

class PasswordValidator {
  /// private
  PasswordValidator._();

  static String? validate(String? input) {
    return RegexPattern.securePasswordPattern.hasMatch(input ?? '') ? null : ErrorMessage.enterValidPassword;
  }
}
