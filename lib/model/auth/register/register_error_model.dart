import 'package:equatable/equatable.dart';

class RegisterErrorModel extends Equatable {
  final String nama;
  final String email;
  final String password;

  const RegisterErrorModel(
      {this.nama = '', this.email = '', this.password = ''});

  RegisterErrorModel copyWith({String? nama, String? email, String? password}) {
    return RegisterErrorModel(
        nama: nama ?? this.nama,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  factory RegisterErrorModel.fromJson(Map<String, dynamic> json) {
    return RegisterErrorModel(
        nama: json['nama'] != null ? json['nama'].join() : '',
        email: json['email'] != null ? json['email'].join() : '',
        password: json['password'] != null ? json['password'].join() : '');
  }

  List<Object> get props => [nama, email, password];
}
