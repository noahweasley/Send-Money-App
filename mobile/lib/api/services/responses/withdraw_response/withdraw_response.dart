import 'package:json_annotation/json_annotation.dart';

part 'withdraw_response.g.dart';

@JsonSerializable()
class WithdrawResponse {
  final String status;
  final String message;
  final Data data;

  WithdrawResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WithdrawResponse.fromJson(Map<String, dynamic> json) => _$WithdrawResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int withdrawal;

  Data({required this.withdrawal});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
