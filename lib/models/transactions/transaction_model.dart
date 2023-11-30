import 'dart:convert';

List<TransactionModel> transactionsFromJson(dynamic str) =>
    List<TransactionModel>.from((str).map((x) => TransactionModel.fromJson(x)));

TransactionModel transferResponseJson(String str) => TransactionModel.fromJson(json.decode(str));

class TransactionModel {
  late String? id;
  late String? transactionType;
  late String? phoneNumber;
  late String? sender;
  late int? transactionAmount;
  late dynamic transactionTime;

  TransactionModel({
    this.id,
    this.transactionType,
    this.phoneNumber,
    this.sender,
    this.transactionAmount,
    this.transactionTime,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    transactionType = json["transactionType"];
    phoneNumber = json["phoneNumber"];
    sender = json["sender"];
    transactionAmount = json["transactionAmount"];
    transactionTime = json["transactionTime"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["_id"] = id;
    data["transactionType"] = transactionType;
    data["phoneNumber"] = phoneNumber;
    data["sender"] = sender;
    data["transactionAmount"] = transactionAmount;
    data["transactionTime"] = transactionTime;

    return data;
  }
}
