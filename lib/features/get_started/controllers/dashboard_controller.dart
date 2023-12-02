import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _balance = ''.obs;
  String get balance => _balance.value;
  set balance(String value) => _balance.value = value;

  final _name = ''.obs;
  String get name => _name.value;
  set name(String value) => _name.value = value;

  final _phoneNumber = ''.obs;
  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;
}
