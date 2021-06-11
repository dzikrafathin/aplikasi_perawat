import 'package:dio/dio.dart';

final String baseUrl = 'http://10.0.2.2:8000/api/perawat/';
final Dio api = Dio(BaseOptions(
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    headers: {'Accept': Headers.jsonContentType}));

// class ApiTanpaToken {
//   final Dio api;
//   ApiTanpaToken()
//       : api =
// }

// class ApiDenganToken extends ApiTanpaToken {
//   final AuthBloc _authBloc;
//   ApiDenganToken({required AuthBloc authBloc})
//       : _authBloc = authBloc,
//         super() {
//     _authBloc.stream.listen((state) {
//       if (state is SudahLoginState) {
//         _setToken(state.token);
//         print('token diatur!');
//       }
//     });
//   }

//   void _setToken(String token) {
//     this.api.options.headers['Authorization'] = 'Bearer $token';
//   }
// }
