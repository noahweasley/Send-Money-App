import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  late final String? message;
  late final Data? data;

  SignupResponse({
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class Data {
  final String email;
  final String name;
  final String phoneNumber;
  final String accountType;
  final int balance;
  final String id;

  Data({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.accountType,
    required this.balance,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
