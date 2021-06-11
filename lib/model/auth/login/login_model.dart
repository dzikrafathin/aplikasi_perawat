import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;

  const LoginModel({this.email = '', this.password = ''});

  LoginModel copyWith({String? email, String? password}) {
    return LoginModel(
        email: email ?? this.email, password: password ?? this.password);
  }

  Map<String, dynamic> toJson() =>
      {'email': this.email, 'password': this.password};

  List<Object> get props => [email, password];
}
