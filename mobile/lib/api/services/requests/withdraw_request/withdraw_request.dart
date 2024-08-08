import 'package:json_annotation/json_annotation.dart';

part 'withdraw_request.g.dart';

@JsonSerializable()
class WithdrawRequest {
  final String phoneNumber;
  final int amount;

  WithdrawRequest({
    required this.phoneNumber,
    required this.amount,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) => _$WithdrawRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawRequestToJson(this);
}
