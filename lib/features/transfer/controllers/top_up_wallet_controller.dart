import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/core/utilities/currency_format.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widget/notifiers.dart';

class TopupWalletController extends GetxController {
  final transactionRepository = TransactionRepository();
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();

  final _isLoading = false.obs;
  set isLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final _walletBalance = ''.obs;
  set walletBalance(String value) => _walletBalance.value = value;
  String get walletBalance => _walletBalance.value;

  @override
  void onInit() {
    super.onInit();
    walletBalance = 'Wallet balance: ${CurrencyFormat.ngnFormatMoney(0)}';
  }

  void topupWallet() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isLoading = true;

      try {
        final response = await transactionRepository.fundWalletAsync(int.parse(amountController.text));

        Notifiers.showAppDialog(
          title: 'Successful',
          subtitle: 'You have successfully funded your wallet with ${response.data.sent}',
        );
      } on Exception catch (err) {
        Notifiers.showSnackBar(
          type: NotificationType.warning,
          message: err.neatMessage,
        );
      } finally {
        isLoading = false;
      }
    }
  }
}
