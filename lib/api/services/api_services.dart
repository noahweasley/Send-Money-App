import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:veegil/api/models/transactions/transaction_model.dart';
import 'package:veegil/api/models/users/user_model.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/utilities/config.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> transfer(TransactionModel model) async {
    final loginDetails = SessionManager.getLoginDetails();

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    final url = Uri.http(
      Config.apiURL,
      Config.transferAPI,
    );

    final response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> withdraw(TransactionModel model) async {
    final loginDetails = SessionManager.getLoginDetails();

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    final url = Uri.http(
      Config.apiURL,
      Config.withdrawAPI,
    );

    final response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<TransactionModel>?> getTransactions() async {
    final loginDetails = SessionManager.getLoginDetails();

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    const singleTransactionURL = '';

    final url = Uri.http(
      Config.apiURL,
      singleTransactionURL,
    );

    final response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return transactionsFromJson(data['transaction']);
    } else {
      return null;
    }
  }

  static Future<List<UserModel>?> getUserProfile() async {
    final loginDetails = SessionManager.getLoginDetails();

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };

    const userURL = '';

    final url = Uri.http(Config.apiURL, userURL);

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return usersFromJson(data['data']);
    } else {
      return null;
    }
  }
}
