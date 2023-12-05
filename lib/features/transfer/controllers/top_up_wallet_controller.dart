import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
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
    final balance = SessionManager.readUserAccountBalance();
    walletBalance = 'Wallet balance: ${CurrencyFormat.ngnFormatMoney(balance)}';
  }

  Future<void> giveResults() async {
    Get.back(result: walletBalance);
  }

  void topupWallet() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isLoading = true;

      try {
        final response = await transactionRepository.fundWalletAsync(int.parse(amountController.text));
        final amount = CurrencyFormat.ngnFormatMoney(response.data.sent);

        Notifiers.showAppDialog(
          type: NotificationType.success,
          title: 'Successful',
          subtitle: 'You have successfully funded your wallet with $amount}',
          buttons: [
            DialogButton(
              label: 'OK',
              onTap: Get.back,
            ),
          ],
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
