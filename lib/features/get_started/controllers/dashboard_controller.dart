import 'package:get/get.dart';

class DashboardController extends GetxController {
  String saving = 'Total Savings';

  final _accountNumber = '7065478947'.obs;

  var transactions;

  String get accountNumber => _accountNumber.value;
  set accountNumber(String value) => _accountNumber.value = value;

  final _balance = '0'.obs;
  String get balance => _balance.value;
  set balance(String value) => _balance.value = value;

  final _name = 'Noah'.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _greeting = 'Hello'.obs;
  String get greeting => _greeting.value;
  set greeting(String value) => _greeting.value = value;

  final _phoneNumber = ''.obs;
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;

  void refreshScreen() {}
}
