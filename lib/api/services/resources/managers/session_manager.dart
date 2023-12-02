import 'package:veegil/api/services/resources/managers/session_constants.dart';
import 'package:veegil/api/services/responses/login_response/login_response.dart';
import 'package:veegil/core/database/constants.dart';
import 'package:veegil/core/database/database.dart';

class SessionManager {
  static final db = DatabaseService.instance;

  static String? readAuthorizationToken() {
    return db.getData(SessionConstants.userAccessToken, null);
  }

  static writeAuthorizationToken(String token) async {
    await db.setData(SessionConstants.userAccessToken, token);
  }

  static bool isLoggedIn() {
    final isUserLoggedIn = db.getData(SessionConstants.isUserLoggedIn, false);

    return isUserLoggedIn;
  }

  static LoginResponse? getLoginDetails() {
    var isUserLoggedIn = isLoggedIn();

    if (isUserLoggedIn) {
      final userData = db.getData(SessionConstants.loggingDetails, null);
      return LoginResponse.fromJson(userData);
    }
    return null;
  }

  static void setLoginDetails(LoginResponse loginResponse) async {
    db.setData(SessionConstants.loggingDetails, loginResponse.toJson());
  }

  static Future<void> logout() async {
    db.deleteData(SessionConstants.loggingDetails);
  }
}
