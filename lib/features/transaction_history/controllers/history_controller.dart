import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:veegil/api/repositories/transaction_repository.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';
import 'package:veegil/core/utilities/extensions/error_extension.dart';
import 'package:veegil/core/widget/notifiers.dart';

class HistoryController extends GetxController {
  final repository = TransactionRepository();
  final filterTypes = ['New to Old', 'Old to New', 'Monthly', 'Yearly'];

  final _period = 'Today'.obs;
  String get period => _period.value;
  set period(String value) => _period.value = value;

  final _selectedFilterType = 'New to Old'.obs;
  String get selectedFilterType => _selectedFilterType.value;
  set selectedFilterType(String value) => _selectedFilterType.value = value;

  final historyItems = <Transaction>[].obs;
  final todayTransaction = <Transaction>[].obs;
  final earlierTransaction = <Transaction>[].obs;

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final _isHistorySorted = false.obs;
  bool get isHistorySorted => _isHistorySorted.value;
  set isHistorySorted(bool value) => _isHistorySorted.value = value;

  @override
  void onInit() {
    isLoading = true;
    retrieveTransactionHistory();
    super.onInit();
  }

  void filterList(String sortLabel) {
    switch (sortLabel) {
      case 'New to Old':
        historyItems.sort(Transaction.sortByNewToOld);
        break;
      case 'Old to New':
        historyItems.sort(Transaction.sortByOldToNew);
        break;
      case 'Monthly':
        historyItems.sort(Transaction.sortByMonthly);
        break;
      case 'Yearly':
        historyItems.sort(Transaction.sortByYearly);
        break;
      default:
        throw UnsupportedError('$sortLabel filter is not supported yet');
    }
    selectedFilterType = sortLabel;
    period = sortLabel;
    isHistorySorted = true;
  }

  Future<void> retrieveTransactionHistory() async {
    isLoading = true;
    final uPhoneNumber = SessionManager.readUserAccountNumber();

    try {
      if (uPhoneNumber == null) {
        throw Exception('Phone number was not saved, please re-login');
      }

      final response = await repository.retrieveUserTransactionsAsync();
      if (response.data.isNotEmpty) {
        // find this user's specific unique account details
        final dList = response.data.where((element) => element.phoneNumber == uPhoneNumber);
        // Sort lists in reverse chronological order
        historyItems.value = dList.sorted(Transaction.sortByNewToOld);
        todayTransaction.value = historyItems.where((transaction) => transaction.isTodayTransaction).toList();
        earlierTransaction.value = historyItems.where((transaction) => !transaction.isTodayTransaction).toList();
      }
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
