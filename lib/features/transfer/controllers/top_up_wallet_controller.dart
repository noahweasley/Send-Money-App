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

  final _balance = ''.obs;
  set balance(String value) => _balance.value = value;
  String get balance => _balance.value;

  String get walletBalance => 'Wallet balance: $balance';

  @override
  void onInit() {
    super.onInit();
    balance = CurrencyFormat.ngnFormatMoney(SessionManager.readUserAccountBalance());
  }

  Future<void> giveResults() async {
    Get.back(result: balance);
  }

  void topupWallet() async {
    final formState = formKey.currentState;

    if (formState!.validate()) {
      formState.save();
      isLoading = true;

      try {
        final response = await transactionRepository.fundWalletAsync(int.parse(amountController.text));

        final double bal = SessionManager.readUserAccountBalance() + response.data.sent;
        balance = CurrencyFormat.ngnFormatMoney(bal);
        await SessionManager.writeUserAccountBalance(bal);

        final amount = CurrencyFormat.ngnFormatMoney(response.data.sent);

        Notifiers.showAppDialog(
          type: NotificationType.success,
          title: 'Successful',
          subtitle: 'You have successfully funded your wallet with $amount',
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
