import 'package:equatable/equatable.dart';

class LoginErrorModel extends Equatable {
  final String email;
  final String password;

  const LoginErrorModel({this.email = '', this.password = ''});

  LoginErrorModel copyWith({String? email, String? password}) {
    return LoginErrorModel(
        email: email ?? this.email, password: password ?? this.password);
  }

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) {
    return LoginErrorModel(
        email: json['email'] != null ? json['email'].join() : '',
        password: json['password'] != null ? json['password'].join() : '');
  }

  List<Object> get props => [email, password];
}
