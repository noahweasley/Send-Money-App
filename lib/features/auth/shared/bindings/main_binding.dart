import 'package:get/get.dart';
import 'package:veegil/features/auth/controllers/login_controller.dart';
import 'package:veegil/features/auth/controllers/signup_controller.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => DashboardController());
  }
}
