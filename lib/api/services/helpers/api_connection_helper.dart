import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:veegil/api/services/enums/environment.dart';
import 'package:veegil/api/services/helpers/api_config_helper.dart';
import 'package:veegil/api/services/resources/interceptors/app_interceptors.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';

class ApiConnectionHelper {
  static const Environment env = Environment.production;
  static const Duration receiveTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(seconds: 20);
  static const Duration connectTimeout = Duration(seconds: 20);

  static String baseUrl = ApiConfigHelper.getBaseUrlOnEnvironment(env);

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      sendTimeout: env == Environment.production ? sendTimeout : null,
      connectTimeout: env == Environment.production ? connectTimeout : null,
      receiveTimeout: env == Environment.production ? receiveTimeout : null,
      validateStatus: (status) => status! >= 200,
      headers: {
        'Accept': '*/*',
        'Authorization': 'Bearer ${SessionManager.readAuthorizationToken()}',
      },
    ),
  )..interceptors.addAll([
      AppInterceptors(),
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: true,
      //   error: true,
      //   compact: true,
      //   maxWidth: 90,
      // ),
    ]);

  /// GET request
  Future<Response<dynamic>> getDataAsync({
    required String url,
    Options? requestOptions,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.get(
      url,
      options: requestOptions,
      queryParameters: queryParameters,
    );
    return response;
  }

  /// POST request
  Future<Response<dynamic>> postDataAsync({
    dynamic requestData,
    required String path,
    Options? requestOptions,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.post(
      path,
      data: jsonEncode(requestData),
      options: requestOptions,
      queryParameters: queryParameters,
    );
    return response;
  }

  /// PATCH request
  Future<Response<dynamic>> updateDataAsync({
    dynamic requestData,
    required String path,
    Options? requestOptions,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.patch(
      path,
      data: jsonEncode(requestData),
      options: requestOptions,
      queryParameters: queryParameters,
    );
    return response;
  }

  /// DELETE request
  Future<Response<dynamic>> deleteDataAsync({
    dynamic requestData,
    required String path,
    Options? requestOptions,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.delete(
      path,
      data: jsonEncode(requestData),
      options: requestOptions,
      queryParameters: queryParameters,
    );
    return response;
  }
}
