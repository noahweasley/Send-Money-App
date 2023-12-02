import 'dart:io';

import 'package:dio/dio.dart';
import 'package:veegil/api/services/endpoints.dart';
import 'package:veegil/api/services/exceptions/dio_exceptions.dart';
import 'package:veegil/api/services/helpers/api_connection_helper.dart';
import 'package:veegil/api/services/helpers/status_code.dart';
import 'package:veegil/api/services/requests/login_request/login_request.dart';
import 'package:veegil/api/services/requests/signup_request/signup_request.dart';
import 'package:veegil/api/services/responses/login_response/login_response.dart';
import 'package:veegil/api/services/responses/signup_response/signup_response.dart';

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
