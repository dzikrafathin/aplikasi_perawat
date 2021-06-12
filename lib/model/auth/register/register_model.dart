import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String nama;
  final String email;
  final String password;

  const RegisterModel({this.nama = '', this.email = '', this.password = ''});

  RegisterModel copyWith({String? nama, String? email, String? password}) {
    return RegisterModel(
        nama: nama ?? this.nama,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  Map<String, dynamic> toJson() =>
      {'nama': this.nama, 'email': this.email, 'password': this.password};

  List<Object> get props => [nama, email, password];
}
