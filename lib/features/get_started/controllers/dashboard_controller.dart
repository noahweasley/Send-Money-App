import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/repositories/user_info_repository.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/navigation/app_routes.dart';
import 'package:veegil/core/utilities/currency_format.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widgets/fund_options_bottom_sheet.dart';
import 'package:veegil/core/widgets/notifiers.dart';

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

  final _transactions = <Transaction>[].obs;
  List<Transaction> get transactions => _transactions;
  set transactions(List<Transaction> value) => _transactions.value = value;

  final _showingBarGroups = <BarChartGroupData>[].obs;
  List<BarChartGroupData> get showingBarGroups => _showingBarGroups;
  set showingBarGroups(List<BarChartGroupData> value) => _showingBarGroups.value = value;

  @override
  void onInit() {
    super.onInit();
    accountNumber = SessionManager.readUserAccountNumber() ?? 'NIL';
    name = SessionManager.readUserName() ?? 'User';
    retrieveUserDetails();
    retrieveLatestTransaction();
  }

  Future<void> refreshPage() async {
    await retrieveUserDetails();
    await retrieveLatestTransaction();
  }

  Future<void> topup() async {
    await FundOptionsBottomSheet.show(
      bankName: 'Veegil Bank',
      accountNumber: accountNumber,
      onOtherOptionsTap: () async {
        final results = await Get.toNamed(Routes.topUp);
        balance = results as String;
      },
    );
  }

  Future<void> logout() async {
    await SessionManager.logoutUser();
    Get.offAllNamed(Routes.login);
  }

  void editName() {}

  void showInfo() {
    Notifiers.showAppDialog(
      title: 'Info',
      subtitle: 'Latest transactions shows only your 10 most recent transactions,'
          ' click on the history navigation item at the bottom of your screen, to view everything',
      buttons: [
        DialogButton(
          label: 'Ok',
          onTap: Get.back,
        ),
      ],
    );
  }

  Future<void> navigateToWithdraw() async {
    final results = await Get.toNamed(Routes.withdraw);
    balance = results as String;
  }

  Future<void> navigateToTransfer() async {
    final results = await Get.toNamed(Routes.transfer);
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
        final dList = response.data.where((element) => element.phoneNumber == accountNumber);
        final userData = dList.sorted(Transaction.sortByNewToOld).take(10);
        if (userData.isNotEmpty) {
          // show filtered list
          transactions = userData.toList();
          showChart();
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

  void showChart() {
    for (int x = DateTime.january; x <= DateTime.december; x++) {
      showingBarGroups.add(makeGroupData(x));
    }
  }

  BarChartGroupData makeGroupData(int month) {
    final transactions = getTransactionsForMonth(month);
    final y1 = transactions[0];
    final y2 = transactions[1];

    return BarChartGroupData(
      barsSpace: 6,
      x: month - 1,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: AppColor.primaryMain,
          width: 12,
        ),
        BarChartRodData(
          toY: y2,
          color: AppColor.red,
          width: 12,
        ),
      ],
    );
  }

  List<double> getTransactionsForMonth(int month) {
    int debits = 0;
    int credits = 0;

    for (var trans in transactions) {
      print('month: ${trans.created.month}');
      if (trans.created.month == month) {
        if (trans.type == Transaction.debit) {
          debits++;
        } else if (trans.type == Transaction.credit) {
          credits++;
        }
      }
    }
    print('The credit: $credits, Debits $debits');
    return [credits.toDouble(), debits.toDouble()];
  }
}
