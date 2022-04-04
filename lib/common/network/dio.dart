import 'package:baseblocflutter/common/utils/index.dart';
import 'package:dio/dio.dart';

import '../config/pretty_dio_logger.dart';

class DioBuilder {
  Dio? dio;
  Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio?.options.headers['content-Type'] = 'application/json';
      dio?.interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
          AuthInterceptor()
        ],
      );
    }
    return dio!;
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await Preference.getItem(PreferenceConstant.token);
    options.headers.addAll({"Authorization": "Bearer $token"});
    handler.next(options);
  }
}
