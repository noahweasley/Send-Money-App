import 'package:veegil/api/services/resources/managers/session_constants.dart';
import 'package:veegil/api/services/responses/login_response/login_response.dart';
import 'package:veegil/core/database/database.dart';

class SessionManager {
  static final db = DatabaseService.instance;

  static Future<void> writeUserAccountNumber(String accountNumber) async {
    await db.setData(SessionConstants.userAccountNumber, accountNumber);
  }

  static String? readUserAccountNumber() {
    return db.getData(SessionConstants.userAccountNumber, null);
  }

  static Future<void> writeUserName(String accountNumber) async {
    await db.setData(SessionConstants.userName, accountNumber);
  }

  static String? readUserName() {
    return db.getData(SessionConstants.userName, null);
  }

  static String? readAuthorizationToken() {
    return db.getData(SessionConstants.userAccessToken, null);
  }

  static Future<void> writeAuthorizationToken(String token) async {
    await db.setData(SessionConstants.userAccessToken, token);
  }

  static bool isLoggedIn() {
    final isUserLoggedIn = db.getData(SessionConstants.isUserLoggedIn, false);

    return isUserLoggedIn;
  }

  // TODO: Remove
  static LoginResponse? getLoginDetails() {
    final isUserLoggedIn = isLoggedIn();

    if (isUserLoggedIn) {
      final userData = db.getData(SessionConstants.loggingDetails, null);

      return LoginResponse.fromJson(userData);
    }
    return null;
  }

  // TODO: Remove
  static void setLoginDetails(LoginResponse loginResponse) async {
    db.setData(SessionConstants.loggingDetails, loginResponse.toJson().toString());
  }

  static Future<void> logout() async {
    db.deleteData(SessionConstants.loggingDetails);
  }
}
