import 'package:veegil/core/validators/error_messages.dart';

class EmptyStringValidator {
  /// private
  EmptyStringValidator._();

  static String? validate(String? input) => input != null && input.isEmpty ? ErrorMessage.nonEmpty : null;
}
