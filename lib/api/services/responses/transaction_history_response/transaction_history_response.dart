import 'package:json_annotation/json_annotation.dart';

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
  final num amount;
  final String type;
  final num? balance;
  final String phoneNumber;
  final DateTime created;

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
