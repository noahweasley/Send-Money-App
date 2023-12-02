import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  late final String? status;
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
  final String phoneNumber;
  final DateTime created;

  Data({
    required this.phoneNumber,
    required this.created,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
