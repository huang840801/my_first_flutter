import 'package:dio/dio.dart';

class GithubAPi {
  late Dio _dio;

  GithubAPi() {
    var options = BaseOptions(
        baseUrl: "http://api.github.com/users",
        connectTimeout: 5000,
        receiveTimeout: 5000);
    var dio = Dio(options);
    this._dio = dio;
  }

  Future<Map<String, dynamic>> fetch(String service,
      {Map<String, dynamic>? parameters}) async {
    try {
      var res = await _dio.get(service, queryParameters: parameters);
      return res.data;
    } catch (e) {
      print("Huang "+e.toString());
      return {};
    }
  }
}
