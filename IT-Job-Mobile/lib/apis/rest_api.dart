import '../config/dio/dio_client.dart';

class RestAPI {
  DioClient dioClient = DioClient();

  Future<T> get<T>(String url) async {
    try {
      final response = await dioClient.getDio.get(url);
      final a = [];

      // if (response.statusCode == ResponseStatus.SUCCESS.statusCode) {
      //   return response.data;
      // }
      return response.data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<T> post<T>(String url, Object body) async {
    try {
      final response = await dioClient.getDio.post(url, data: body);
      // if (response.statusCode == ResponseStatus.SUCCESS.statusCode ||
      //     response.statusCode == ResponseStatus.CREATED.statusCode) {
      //   return response.data;
      // }
      return response.data;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
