import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/repositories/user_info_repository.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/currency_format.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widget/fund_options_bottom_sheet.dart';
import 'package:veegil/core/widget/notifiers.dart';

class DashboardController extends GetxController {
  final userInfoRepository = UserInfoRepository();
  final transactionRepository = TransactionRepository();
  final formKey = GlobalKey<FormState>();

  final _isUserDetailsLoading = true.obs;
  bool get isUserDetailsLoading => _isUserDetailsLoading.value;
  set isUserDetailsLoading(bool value) => _isUserDetailsLoading.value = value;

  final _isTransactionLoading = true.obs;
  bool get isTransactionLoading => _isTransactionLoading.value;
  set isTransactionLoading(bool value) => _isTransactionLoading.value = value;

  final _accountNumber = '...loading'.obs;
  String get accountNumber => _accountNumber.value;
  set accountNumber(String value) => _accountNumber.value = value;

  final _balance = '...loading'.obs;
  String get balance => _balance.value;
  set balance(String value) => _balance.value = value;

  final _name = 'User'.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _greeting = 'Hello'.obs;
  String get greeting => _greeting.value;
  set greeting(String value) => _greeting.value = value;

  final _phoneNumber = '...loading'.obs;
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;

  final _transactions = <Transaction>[].obs;
  List<Transaction> get transactions => _transactions;
  set transactions(List<Transaction> value) => _transactions.value = value;

  @override
  void onInit() {
    super.onInit();
    accountNumber = SessionManager.readUserAccountNumber() ?? 'NIL';
    name = SessionManager.readUserName() ?? 'User';
    retrieveUserDetails();
    retrieveLatestTransaction();
  }

  Future<void> topup() async {
    await FundOptionsBottomSheet.show(
      bankName: 'Veegil Bank',
      accountNumber: accountNumber,
      onOtherOptionsTap: () => Get.toNamed(Routes.topUp),
    );
  }

  Future<void> navigateToWithdraw() async {
    final results = await Get.toNamed(Routes.withdraw);
    balance = results as String;
  }

  Future<void> retrieveUserDetails() async {
    try {
      if (accountNumber == 'NIL') {
        throw Exception('Phone number was not saved, please re-login');
      }

      isUserDetailsLoading = true;
      final response = await userInfoRepository.retrieveUserInfoAsync();
      if (response.data.isNotEmpty) {
        // find this user's specific unique account details
        final userData = response.data.firstWhereOrNull((element) => element.phoneNumber == accountNumber);
        if (userData != null) {
          balance = CurrencyFormat.ngnFormatMoney(userData.balance);
          accountNumber = userData.phoneNumber;
          await Future.wait([
            SessionManager.writeUserAccountBalance(userData.balance),
            SessionManager.writeUserAccountNumber(userData.phoneNumber),
          ]);
        } else {
          // if for any reason API doesn't have any record of user phone number
          throw Exception('User account for $accountNumber was not found, please sign-up');
        }
      }
    } on Exception catch (err) {
      // set to previous balance if network call fails
      balance = CurrencyFormat.ngnFormatMoney(SessionManager.readUserAccountBalance());

      Notifiers.showSnackBar(
        type: NotificationType.warning,
        message: err.neatMessage,
      );
    } finally {
      isUserDetailsLoading = false;
    }
  }

  Future<void> retrieveLatestTransaction() async {
    try {
      if (accountNumber == 'NIL') {
        throw Exception('Phone number was not saved, please re-login');
      }

      isTransactionLoading = true;
      final response = await transactionRepository.retrieveUserTransactionsAsync();
      if (response.data.isNotEmpty) {
        // find this user's specific unique account transaction
        final userData = response.data.where((element) => element.phoneNumber == accountNumber).take(10);
        if (userData.isNotEmpty) {
          // show filtered list
          transactions = userData.toList();
        } else {
          // if for any reason API doesn't have any record of user phone number
          throw Exception('User account for $accountNumber was not found, please sign-up');
        }
      }
    } on Exception catch (err) {
      Notifiers.showSnackBar(
        type: NotificationType.warning,
        message: err.neatMessage,
      );
    } finally {
      isTransactionLoading = false;
    }
  }

  void transfer() {}
}
