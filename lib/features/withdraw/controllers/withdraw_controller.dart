import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/utilities/currency_format.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widget/notifiers.dart';

class WithdrawController extends GetxController {
  final transactionRepository = TransactionRepository();
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();

  final _isProcessing = false.obs;

  bool get isProcessing => _isProcessing.value;
  set isProcessing(bool value) => _isProcessing.value = value;

  final _balance = ''.obs;
  String get balance => _balance.value;
  set balance(String value) => _balance.value = value;

  @override
  void onInit() {
    super.onInit();
    balance = CurrencyFormat.ngnFormatMoney(SessionManager.readUserAccountBalance());
  }

  Future<void> giveResults() async {
    Get.back(result: balance);
  }

  Future<void> withdraw() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isProcessing = true;

      try {
        final response = await transactionRepository.withdrawMoneyAsync(int.parse(amountController.text));
        final double bal = SessionManager.readUserAccountBalance() - response.data.withdrawal;
        balance = CurrencyFormat.ngnFormatMoney(bal);
        await SessionManager.writeUserAccountBalance(bal);

        final withdrawal = CurrencyFormat.ngnFormatMoney(response.data.withdrawal);
        Notifiers.showAppDialog(
            type: NotificationType.success,
            title: 'Successful',
            subtitle: '$withdrawal was deducted from your account',
            buttons: [
              DialogButton(
                label: 'Ok',
                onTap: Get.back,
              ),
            ]);
      } on Exception catch (err) {
        Notifiers.showSnackBar(
          type: NotificationType.warning,
          message: err.neatMessage,
        );
      } finally {
        isProcessing = false;
      }
    }
  }
}
