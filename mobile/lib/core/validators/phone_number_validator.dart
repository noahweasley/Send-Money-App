import 'package:send_money_app/core/validators/error_messages.dart';
import 'package:send_money_app/core/validators/regex_patterns.dart';

class PhoneNumberValidator {
  /// private
  PhoneNumberValidator._();

  static String? validate(String? input) {
    return RegexPattern.nigeriaPhoneNumber.hasMatch(input ?? '') ? null : ErrorMessage.enterValidPhone;
  }
}
