import 'package:dio/dio.dart';

import '../../constants/label.dart';
import '../shared/shared_preferences.dart';

class DioClient {
  Dio configDio() {
    var options = BaseOptions(
      baseUrl: 'https://airbnbteam.herokuapp.com/v1/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    final dio = Dio(options);
    AppPreference appPreferences = AppPreference();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String token = await appPreferences.getToken();
      if (token != '') {
        options.headers[Label.authorization] = 'Bearer ' + token;
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
    return dio;
  }

  Dio get getDio => configDio();
}
