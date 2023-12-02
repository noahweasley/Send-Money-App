import 'package:veegil/core/validators/error_messages.dart';

class EquValidator {
  /// private
  EquValidator._();

  static String? validate(String? input1, String? input2, {String? message}) {
    return input1 != input2 ? ErrorMessage.passwordNotEqual : message;
  }
}
