import 'package:send_money_app/api/services/enums/environment.dart';

class ApiConfigHelper {
  static String getBaseUrlOnEnvironment(Environment environment) {
    const defaultBaseUrl = 'https://bankapi.send_money_app.com/';
    String baseUrl;

    switch (environment) {
      case Environment.staging:
        baseUrl = defaultBaseUrl;
        break;
      case Environment.dev:
        baseUrl = defaultBaseUrl;
        break;
      case Environment.production:
        baseUrl = defaultBaseUrl;
        break;
      }

    return baseUrl;
  }
}
