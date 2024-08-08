// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:veegil/core/utilities/currency_format.dart';

part 'transaction_history_response.g.dart';

@JsonSerializable()
class TransactionHistoryResponse {
  final String status;
  final List<Transaction> data;

  TransactionHistoryResponse({
    required this.status,
    required this.data,
  });

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) => _$TransactionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryResponseToJson(this);
}

@JsonSerializable()
class Transaction {
  static const String debit = 'debit';
  static const String credit = 'credit';

  final num? amount;
  final num? balance;
  final String type;
  final String phoneNumber;
  final DateTime created;

  bool get isTodayTransaction => created.day == DateTime.now().day;

  String get dAmount {
    return '${(type == credit ? '+' : '-')}${CurrencyFormat.ngnFormatMoney(amount)}';
  }

  String get dType {
    return type.toUpperCase();
  }

  String get dCreated {
    return DateFormat('y-MM-dd, HH:mm:ss').format(created);
  }

  String get dPhoneNumber {
    return (type == credit) ? 'To You' : 'From Bank';
  }

  Transaction({
    required this.amount,
    required this.type,
    required this.balance,
    required this.phoneNumber,
    required this.created,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  static int Function(Transaction, Transaction) sortByNewToOld = (a, b) => -a.created.compareTo(b.created);

  static int Function(Transaction, Transaction) sortByOldToNew = (a, b) => (a.created.compareTo(b.created));

  static int Function(Transaction, Transaction) sortByMonthly = (a, b) => a.created.month.compareTo(b.created.month);

  static int Function(Transaction, Transaction) sortByYearly = (a, b) => a.created.year.compareTo(b.created.year);

  @override
  String toString() {
    return 'Transaction(amount: $amount, balance: $balance, type: $type, phoneNumber: $phoneNumber, created: $created)';
  }
}
