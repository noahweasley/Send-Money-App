import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  final Data data;

  LoginResponse({
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  final String phoneNumber;
  final String email;
  final String name;
  final String id;
  final String token;
  final int balance;

  Data({
    required this.phoneNumber,
    required this.email,
    required this.name,
    required this.id,
    required this.token,
    required this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
