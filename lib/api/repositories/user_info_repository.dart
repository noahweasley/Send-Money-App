import 'dart:io';

import 'package:dio/dio.dart';
import 'package:veegil/api/services/endpoints.dart';
import 'package:veegil/api/services/exceptions/dio_exceptions.dart';
import 'package:veegil/api/services/helpers/api_connection_helper.dart';
import 'package:veegil/api/services/helpers/status_code.dart';
import 'package:veegil/api/services/responses/user_info_response/user_info_response.dart';

class UserInfoRepository {
  final apiConnectionHelper = ApiConnectionHelper();

  /// retrieve user info
  Future<UserInfoResponse> retrieveUserInfoAsync() async {
    try {
      final response = await apiConnectionHelper.getDataAsync(
        url: Endpoint.users,
      );

      if (response.statusCode == HttpStatusCodes.ok) {
        return UserInfoResponse.fromJson(response.data);
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
