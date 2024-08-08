import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/services/requests/transfer_request/transfer_request.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/utilities/currency_format.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widgets/notifiers.dart';

class TransferController extends GetxController {
  final transactionRepository = TransactionRepository();
  final formKey = GlobalKey<FormState>();
  final phoneNumberTextController = TextEditingController();
  final amountController = TextEditingController();

  final _balance = ''.obs;
  set balance(value) => _balance.value = value;
  get balance => _balance.value;

  final _isProcessing = false.obs;
  set isProcessing(value) => _isProcessing.value = value;
  get isProcessing => _isProcessing.value;

  String get walletBalance => 'Wallet balance: $balance';

  @override
  void onInit() {
    super.onInit();
    balance = CurrencyFormat.ngnFormatMoney(SessionManager.readUserAccountBalance());
  }

  Future<void> giveResults() async {
    Get.back(result: balance);
  }

  Future<void> transfer() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isProcessing = true;

      try {
        final amount = int.parse(amountController.text);

        final request = TransferRequest(
          amount: amount,
          phoneNumber: phoneNumberTextController.text,
        );

        final response = await transactionRepository.transferFundsAsync(request);
        final double bal = SessionManager.readUserAccountBalance() - response.data.withdrawal;
        balance = CurrencyFormat.ngnFormatMoney(bal);
        await SessionManager.writeUserAccountBalance(bal);

        final moneySent = CurrencyFormat.ngnFormatMoney(response.data.withdrawal);

        Notifiers.showAppDialog(
            type: NotificationType.success,
            title: 'Successful',
            subtitle: 'You have sent $moneySent to ${request.phoneNumber}',
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
