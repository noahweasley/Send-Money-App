import 'package:veegil/api/services/resources/managers/session_constants.dart';
import 'package:veegil/api/services/responses/login_response/login_response.dart';
import 'package:veegil/core/database/database.dart';

class SessionManager {
  static final db = DatabaseService.instance;

  static Future<void> writeUserAccountNumber(String accountNumber) async {
    return await db.setData(SessionConstants.userAccountNumber, accountNumber);
  }

  static String? readUserAccountNumber() {
    return db.getData(SessionConstants.userAccountNumber, null);
  }

  static Future<void> writeUserName(String accountNumber) async {
    return await db.setData(SessionConstants.userName, accountNumber);
  }

  static String? readUserName() {
    return db.getData(SessionConstants.userName, null);
  }

  static String? readAuthorizationToken() {
    return db.getData(SessionConstants.userAccessToken, null);
  }

  static Future<void> writeAuthorizationToken(String token) async {
    return await db.setData(SessionConstants.userAccessToken, token);
  }

  static Future<void> writeUserAccountBalance(double? balance) async {
    return await db.setData(SessionConstants.userAccountBalance, balance ?? 0);
  }

  static double readUserAccountBalance() {
    return db.getData(SessionConstants.userAccountBalance, 0);
  }

  static bool isUserLoggedIn() {
    return db.getData(SessionConstants.isUserLoggedIn, false);
  }

  static Future<void> writeIsUserLoggedIn(bool value) async {
    return await db.setData(SessionConstants.isUserLoggedIn, value);
  }

  static bool hasUserOnboard() {
    return db.getData(SessionConstants.hasUserOnboard, false);
  }

  static Future<void> writeIsUserOnBoarded(bool value) async {
    return await db.setData(SessionConstants.hasUserOnboard, value);
  }

  static Future<void> logoutUser() async {
    return await db.deleteAllData([
      SessionConstants.isUserLoggedIn,
      SessionConstants.userAccessToken,
      SessionConstants.userAccountNumber,
      SessionConstants.userName,
      SessionConstants.userAccountBalance,
    ]);
  }

  // TODO: Remove after deleting Services class
  static LoginResponse? getLoginDetails() {
    final _ = isUserLoggedIn();

    if (_) {
      final userData = db.getData(SessionConstants.loggingDetails, null);

      return LoginResponse.fromJson(userData);
    }
    return null;
  }

  // TODO: Remove after deleting Services class
  static void setLoginDetails(LoginResponse loginResponse) async {
    db.setData(SessionConstants.loggingDetails, loginResponse.toJson().toString());
  }
}
