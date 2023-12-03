import 'package:get/get.dart';
import 'package:veegil/features/authentication/controllers/login_controller.dart';
import 'package:veegil/features/authentication/controllers/signup_controller.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';
import 'package:veegil/features/get_started/controllers/main_screen_controller.dart';
import 'package:veegil/features/transfer/controllers/top_up_wallet_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => TopupWalletController());
  }
}
