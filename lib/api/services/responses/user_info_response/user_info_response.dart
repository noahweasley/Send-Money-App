import 'package:json_annotation/json_annotation.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final String status;
  final String message;
  final List<UserData> data;

  UserInfoResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class UserData {
  final String phoneNumber;
  final double balance;
  final DateTime created;

  UserData({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
