import 'package:send_money_app/core/validators/error_messages.dart';
import 'package:send_money_app/core/validators/regex_patterns.dart';

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
