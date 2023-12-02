import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/core/utilities/config.dart';

class AccountProvider with ChangeNotifier {
  int accountBalance = 0;
  static var client = http.Client();

  getBalance() async {
    final loginDetails = SessionManager.getLoginDetails();

    final Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data.token}'
    };

    const accountBalanceURL = '';

    final url = Uri.http(Config.apiURL, accountBalanceURL);

    final response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      accountBalance = data;

      notifyListeners();

      // return usersFromJson(data["balance"]);
    } else {
      return null;
    }
  }
}
