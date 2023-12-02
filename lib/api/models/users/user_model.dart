List<UserModel> usersFromJson(dynamic str) => List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  UserModel({
    required this.phoneNumber,
    required this.email,
    required this.name,
    required this.id,
    required this.token,
    required this.balance,
  });
  late final String phoneNumber;
  late final String email;
  late final String name;
  late final String id;
  late final String token;
  late final int balance;

  UserModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    name = json['name'];
    id = json['_id'];
    token = json['token'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['name'] = name;
    data['_id'] = id;
    data['token'] = token;
    data['balance'] = balance;
    return data;
  }
}
