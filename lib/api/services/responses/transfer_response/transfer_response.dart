import 'package:json_annotation/json_annotation.dart';

part 'transfer_response.g.dart';

@JsonSerializable()
class TransferResponse {
  final String status;
  final String message;
  final Data data;

  TransferResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TransferResponse.fromJson(Map<String, dynamic> json) => _$TransferResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransferResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int sent;

  Data({required this.sent});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
