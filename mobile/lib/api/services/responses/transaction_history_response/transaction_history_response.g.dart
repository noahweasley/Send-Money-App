// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryResponse _$TransactionHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionHistoryResponseToJson(
        TransactionHistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      amount: json['amount'] as num?,
      type: json['type'] as String,
      balance: json['balance'] as num?,
      phoneNumber: json['phoneNumber'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'balance': instance.balance,
      'type': instance.type,
      'phoneNumber': instance.phoneNumber,
      'created': instance.created.toIso8601String(),
    };
