// import 'package:dio/dio.dart';

// import '../shared/shared_preferences.dart';

// class DioInterceptor extends Interceptor {
//   AppPreference appPreferences = AppPreference();
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//     return super.onRequest(options, handler);
//   }

//   @override
//   Future onResponse(Response response, ResponseInterceptorHandler handler) {
//     print(
//         'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
//     return super.onResponse(response, handler);
//   }

//   @override
//   Future onError(DioError err, ErrorInterceptorHandler handler) {
//     print(
//         'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//     return super.onError(err, handler);
//   }
// }
