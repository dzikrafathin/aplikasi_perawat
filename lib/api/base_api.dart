import 'package:dio/dio.dart';

final String baseUrl = 'http://10.0.2.2/8000/api/perawat/';

class ApiTanpaToken {
  final Dio api;
  ApiTanpaToken()
      : api = Dio(BaseOptions(
            baseUrl: baseUrl,
            contentType: Headers.jsonContentType,
            headers: {'Accept': Headers.jsonContentType}));
}

class ApiDenganToken extends ApiTanpaToken {
  ApiDenganToken() : super();

  void _setToken(String token) {
    this.api.options.headers['Authorization'] = 'Bearer $token';
  }
}
