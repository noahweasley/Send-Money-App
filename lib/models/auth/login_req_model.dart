
class LoginReqModel {
  LoginReqModel({
    required this.phoneNumber,
    required this.password,
  });
  late final String phoneNumber;
  late final String password;

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
