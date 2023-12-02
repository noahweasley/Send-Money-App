// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      token: json['token'] as String,
      balance: json['balance'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'name': instance.name,
      'id': instance.id,
      'token': instance.token,
      'balance': instance.balance,
    };
