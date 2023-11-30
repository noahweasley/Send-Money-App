import 'package:veebank/core/database/database.dart';
import 'package:veebank/models/auth/login_res_model.dart';

class SharedService {
  static bool isLoggedIn() {
    final isUserLoggedIn = DatabaseService.instance.getData("is_user_logged_in", false);
    return isUserLoggedIn;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isUserLoggedIn = isLoggedIn();

    if (isUserLoggedIn) {
      final userData = DatabaseService.instance.getData("loggin_details", null);
      return loginResponseJson(userData.toJson().toString());
    }
    return null;
  }

  static Future<void> setLoginDetails(
    LoginResponseModel loginResponse,
  ) async {
    DatabaseService.instance.setData("loggin_details", loginResponse);
  }

  static Future<void> logout() async {
    DatabaseService.instance.deleteData("loggin_details");
  }
}
