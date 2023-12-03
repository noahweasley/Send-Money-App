import 'package:json_annotation/json_annotation.dart';

part 'transfer_request.g.dart';

@JsonSerializable()
class TransferRequest {
  final String phoneNumber;
  final int amount;

  TransferRequest({
    required this.phoneNumber,
    required this.amount,
  });

  factory TransferRequest.fromJson(Map<String, dynamic> json) => _$TransferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);
}
