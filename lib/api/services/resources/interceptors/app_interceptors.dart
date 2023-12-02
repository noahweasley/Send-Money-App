import 'dart:async';

import 'package:dio/dio.dart';
// import 'package:veegil/core/navigations/app_router.dart';
// import 'package:veegil/core/navigations/app_routes.dart';

// final _dio = Dio();

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return handler.next(response);
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    //  RequestOptions options = err.requestOptions;
    //  try {
    //    if (err.message == null) {
    //      handler.reject(err);
    //    } else if (err.message!.contains('ERROR_001') || err.response!.statusCode == 401) {
    //      // this will push a new route and remove all the routes that were present
    //      AppRouter.goNamed(Routes.error);
    //      handler.reject(err);
    //    } else {
    //      var resp = await _dio.request(
    //        err.requestOptions.path,
    //        data: options.data,
    //        cancelToken: options.cancelToken,
    //        onReceiveProgress: options.onReceiveProgress,
    //        onSendProgress: options.onSendProgress,
    //        queryParameters: options.queryParameters,
    //      );
    //      handler.resolve(resp);
    //    }
    //  } on DioException catch (err) {
    //    handler.reject(err);
    //  }

    handler.reject(err);
    return err;
  }
}
