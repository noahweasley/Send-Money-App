import 'package:get/get.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/widget/fund_options_bottom_sheet.dart';

class DashboardController extends GetxController {
  String saving = 'Total Savings';

  final _accountNumber = 'User'.obs;
  String get accountNumber => _accountNumber.value;
  set accountNumber(String value) => _accountNumber.value = value;

  final _balance = '0'.obs;
  String get balance => _balance.value;
  set balance(String value) => _balance.value = value;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _greeting = 'Hello'.obs;
  String get greeting => _greeting.value;
  set greeting(String value) => _greeting.value = value;

  final _phoneNumber = ''.obs;
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;

  var transactions;

  @override
  void onInit() {
    super.onInit();
    accountNumber = SessionManager.readUserAccountNumber() ?? 'NIL';
    name = SessionManager.readUserName() ?? 'User';
  }

  void refreshScreen() {}

  Future<void> topup() async {
    final accountNumber = SessionManager.readUserAccountNumber() ?? 'NIL';
    await showFundOptionsBottomSheet(
      bankName: 'Veegil Bank',
      accountNumber: accountNumber,
      onOtherOptionsTap: () => Get.toNamed(Routes.topUp),
    );
  }
}
