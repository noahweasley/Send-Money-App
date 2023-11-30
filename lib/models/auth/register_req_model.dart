class RegisterReqModel {
  RegisterReqModel({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.email,
    required this.accountType,
    required this.balance,
  });
  late final String name;
  late final String phoneNumber;
  late final String password;
  late final String email;
  late final String accountType;
  late final double balance;

  RegisterReqModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    email = json['email'];
    accountType = json['accountType'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['email'] = email;
    data['accountType'] = accountType;
    data['balance'] = balance;

    return data;
  }
}
