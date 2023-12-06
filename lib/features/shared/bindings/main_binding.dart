import 'package:get/get.dart';
import 'package:veegil/features/authentication/controllers/login_controller.dart';
import 'package:veegil/features/authentication/controllers/signup_controller.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';
import 'package:veegil/features/get_started/controllers/landing_page_controller.dart';
import 'package:veegil/features/transaction_history/controllers/history_controller.dart';
import 'package:veegil/features/transfer/controllers/top_up_wallet_controller.dart';
import 'package:veegil/features/transfer/controllers/transfer_controller.dart';
import 'package:veegil/features/withdraw/controllers/withdraw_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => LandingPageController());
    Get.lazyPut(() => TopupWalletController());
    Get.lazyPut(() => WithdrawController());
    Get.lazyPut(() => TransferController());
    Get.lazyPut(() => HistoryController());
  }
}
