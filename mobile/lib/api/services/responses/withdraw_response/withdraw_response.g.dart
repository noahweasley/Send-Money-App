// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawResponse _$WithdrawResponseFromJson(Map<String, dynamic> json) =>
    WithdrawResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WithdrawResponseToJson(WithdrawResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      withdrawal: json['withdrawal'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'withdrawal': instance.withdrawal,
    };
