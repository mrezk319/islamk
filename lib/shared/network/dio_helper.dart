import 'package:dio/dio.dart';
class Dioo {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
        baseUrl: 'https://muslim-api.herokuapp.com/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(path, {queries}) async {
    return await dio.get(
      path,
      queryParameters: queries,
    );
  }
}
