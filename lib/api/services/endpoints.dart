class Endpoint {
  // end-points
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String users = '/auth/users';
  static const String transfer = '/accounts/transfer';
  static const String withdraw = '/accounts/withdraw';
  static const String accountList = '/accounts/list';
  static const String transactions = '/transactions';

  /// private constructor
  const Endpoint._();

  static String format({
    required String basePath,
    required Map<String, dynamic> pathReplacement,
  }) {
    return _EndpointFormatter(basePath).formatEndpoint(pathReplacement);
  }
}

class _EndpointFormatter {
  final String basePath;

  _EndpointFormatter(this.basePath);

  String formatEndpoint(Map<String, dynamic> pathReplacement) {
    String formattedEndpoint = basePath;

    pathReplacement.forEach((path, value) {
      final placeholder = '{$path}';
      formattedEndpoint = formattedEndpoint.replaceFirst(placeholder, value.toString());
    });

    return formattedEndpoint;
  }
}
