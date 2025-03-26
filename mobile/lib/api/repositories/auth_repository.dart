import 'dart:io';

import 'package:dio/dio.dart';
import 'package:send_money_app/api/services/endpoints.dart';
import 'package:send_money_app/api/services/exceptions/dio_exceptions.dart';
import 'package:send_money_app/api/services/helpers/api_connection_helper.dart';
import 'package:send_money_app/api/services/helpers/status_code.dart';
import 'package:send_money_app/api/services/requests/login_request/login_request.dart';
import 'package:send_money_app/api/services/requests/signup_request/signup_request.dart';
import 'package:send_money_app/api/services/responses/login_response/login_response.dart';
import 'package:send_money_app/api/services/responses/signup_response/signup_response.dart';

class AuthRepository {
  final apiConnectionHelper = ApiConnectionHelper();

  /// login user
  Future<LoginResponse> loginAsync(LoginRequest request) async {
    try {
      final response = await apiConnectionHelper.postDataAsync(
        path: Endpoint.login,
        requestData: request,
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        return LoginResponse.fromJson(response.data);
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

  // Register user
  Future<SignupResponse> signupAsync(SignupRequest request) async {
    try {
      final response = await apiConnectionHelper.postDataAsync(
        path: Endpoint.signup,
        requestData: request,
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        return SignupResponse.fromJson(response.data);
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
