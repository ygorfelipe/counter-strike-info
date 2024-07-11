// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';



// class AuthInterceptor extends Interceptor {
//   final CustomDio dio;

//   AuthInterceptor({required this.dio});
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final sp = await SharedPreferences.getInstance();
//     final accessToken = sp.getString('accessToken');
//     options.headers['Authorization'] = 'Bearer $accessToken';

//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       //* refreshToken
//       //* buscando no backend o refreshToken
//       // pegando path da requisição
//       try {
//         if (err.requestOptions.path != '/auth/refresh') {
//           await _refreshToken(err);
//           await _retryRequest(err, handler);
//         } else {
//           GlobalContext.instance.loginExpire();
//         }
//       } catch (e) {
//         GlobalContext.instance.loginExpire();
//       }
//     } else {
//       handler.next(err);
//     }
//   }

//   Future<void> _refreshToken(DioException err) async {
//     try {
//       final sp = await SharedPreferences.getInstance();
//       final refreshToken = sp.getString('refreshToken');
//       if (refreshToken == null) {
//         return;
//       }
//       final resultRefreshToken = await dio
//           .auth()
//           .put('/auth/refresh', data: {'refresh_token': refreshToken});
//       sp.setString('accessToken', resultRefreshToken.data['access_token']);
//       sp.setString('refreshToken', resultRefreshToken.data['refresh_token']);
//     } on DioException catch (e, s) {
//       log('Erro ao atualizar refreshToken', error: e, stackTrace: s);
//       throw ExpireTokenException();
//     }
//   }

//   Future<void> _retryRequest(
//       DioException err, ErrorInterceptorHandler handler) async {
//     final requestOptions = err.requestOptions;
//     final result = await dio.request(
//       requestOptions.path,
//       options: Options(
//           headers: requestOptions.headers, method: requestOptions.method),
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//     );
//     handler.resolve(Response(
//       requestOptions: requestOptions,
//       data: result.data,
//       statusCode: result.statusCode,
//       statusMessage: result.statusMessage,
//     ));
//   }
// }
