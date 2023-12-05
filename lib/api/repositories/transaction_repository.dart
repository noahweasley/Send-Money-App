import 'dart:io';

import 'package:dio/dio.dart';
import 'package:veegil/api/services/endpoints.dart';
import 'package:veegil/api/services/exceptions/dio_exceptions.dart';
import 'package:veegil/api/services/helpers/api_connection_helper.dart';
import 'package:veegil/api/services/helpers/status_code.dart';
import 'package:veegil/api/services/requests/transfer_request/transfer_request.dart';
import 'package:veegil/api/services/requests/withdraw_request/withdraw_request.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';
import 'package:veegil/api/services/responses/transaction_history_response/transaction_history_response.dart';
import 'package:veegil/api/services/responses/transfer_response/transfer_response.dart';
import 'package:veegil/api/services/responses/withdraw_response/withdraw_response.dart';

class TransactionRepository {
  final apiConnectionHelper = ApiConnectionHelper();

  /// Transfer funds from one user to another
  Future<WithdrawResponse> transferFundsAsync(TransferRequest transferRequest) async {
    final phoneNumber = SessionManager.readUserAccountNumber();

    if (phoneNumber == null) {
      throw Exception('Phone number wasn\'t saved, please re-login');
    }

    try {
      final transferResponse = await apiConnectionHelper.postDataAsync(
        path: Endpoint.transfer,
        requestData: transferRequest,
      );

      if (transferResponse.statusCode != HttpStatusCodes.ok) {
        throw Exception(transferResponse.data['message']);
      }

      final withdrawRequest = WithdrawRequest(
        amount: transferRequest.amount,
        phoneNumber: phoneNumber,
      );

      final withdrawResponse = await apiConnectionHelper.postDataAsync(
        path: Endpoint.withdraw,
        requestData: withdrawRequest,
      );

      if (withdrawResponse.statusCode == HttpStatusCodes.ok) {
        return WithdrawResponse.fromJson(withdrawResponse.data);
      } else {
        throw Exception(transferResponse.data['message']);
      }
    } on DioException catch (e) {
      return Future.error(DioExceptions.fromDioError(e));
    } on SocketException catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Transfer funds from one user to another
  Future<TransferResponse> fundWalletAsync(int amount) async {
    final phoneNumber = SessionManager.readUserAccountNumber();

    if (phoneNumber == null) {
      throw Exception('Phone number wasn\'t saved, please re-login');
    }

    final transferRequest = TransferRequest(
      phoneNumber: phoneNumber,
      amount: amount,
    );

    try {
      final transferResponse = await apiConnectionHelper.postDataAsync(
        path: Endpoint.transfer,
        requestData: transferRequest,
      );

      if (transferResponse.statusCode == HttpStatusCodes.ok) {
        return TransferResponse.fromJson(transferResponse.data);
      } else {
        throw Exception(transferResponse.data['message']);
      }
    } on DioException catch (e) {
      return Future.error(DioExceptions.fromDioError(e));
    } on SocketException catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Withdraw money from user's account
  Future<WithdrawResponse> withdrawMoneyAsync(int amount) async {
    final phoneNumber = SessionManager.readUserAccountNumber();

    if (phoneNumber == null) {
      throw Exception('Phone number wasn\'t saved, please re-login');
    }

    final request = WithdrawRequest(
      phoneNumber: phoneNumber,
      amount: amount,
    );

    try {
      final response = await apiConnectionHelper.postDataAsync(
        path: Endpoint.withdraw,
        requestData: request,
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        return WithdrawResponse.fromJson(response.data);
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      return Future.error(DioExceptions.fromDioError(e));
    } on SocketException catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// retrieve user transactions
  Future<TransactionHistoryResponse> retrieveUserTransactionsAsync() async {
    try {
      final response = await apiConnectionHelper.getDataAsync(
        url: Endpoint.transactions,
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        return TransactionHistoryResponse.fromJson(response.data);
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      return Future.error(DioExceptions.fromDioError(e));
    } on SocketException catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }
}
