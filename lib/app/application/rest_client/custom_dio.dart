import 'package:cs2_info/app/application/config/env/env.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 6),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unAuht() {
    return this;
  }
}
