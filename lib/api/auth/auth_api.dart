import 'dart:convert';

import 'package:dio/dio.dart';

import '../api.dart';
import '../../model/model.dart';

class AuthApi extends ApiTanpaToken {
  Future<String> login(LoginModel loginModel) async {
    final hasil = await this.api.post('login', data: jsonEncode(loginModel));
    if (hasil.statusCode == 201) {
      final token = hasil.data['data']['token'];
      return token;
    } else {
      return '';
    }
  }
}
