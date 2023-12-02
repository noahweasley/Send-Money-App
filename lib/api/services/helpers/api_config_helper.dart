import 'package:veegil/api/services/enums/environment.dart';

class ApiConfigHelper {
  static String getBaseUrlOnEnvironment(Environment environment) {
    const defaultBaseUrl = 'https://bankapi.veegil.com/';
    String baseUrl;

    switch (environment) {
      case Environment.staging:
        baseUrl = defaultBaseUrl;
        break;
      case Environment.dev:
        baseUrl = defaultBaseUrl;
        break;
      case Environment.production:
        baseUrl = '';
        break;
      default:
        baseUrl = defaultBaseUrl; // fallback to staging base url
        break;
    }

    return baseUrl;
  }
}
