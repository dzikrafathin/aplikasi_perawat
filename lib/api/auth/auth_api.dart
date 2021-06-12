import 'dart:convert';

import '../api.dart';
import '../../model/model.dart';

class AuthApi {
  Future<String> login(LoginModel loginModel) async {
    final hasil = await api.post('login', data: jsonEncode(loginModel));
    if (hasil.statusCode == 201) {
      final token = hasil.data['data']['token'];
      return token;
    } else {
      return '';
    }
  }

  Future<String> register(RegisterModel registerModel) async {
    final hasil = await api.post('register', data: jsonEncode(registerModel));
    if (hasil.statusCode == 201) {
      final token = hasil.data['data']['token'];
      return token;
    } else {
      return '';
    }
  }
}
