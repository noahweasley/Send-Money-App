import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
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
    return (type == credit) ? 'TO YOU' : 'From Bank';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Transaction({
    required this.amount,
    required this.type,
    required this.balance,
    required this.phoneNumber,
    required this.created,
  });

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
