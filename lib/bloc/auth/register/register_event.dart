part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  List<Object> get props => [];
}

class RegisterNamaBerubahEvent extends RegisterEvent {
  final String nama;
  const RegisterNamaBerubahEvent(this.nama);
  List<Object> get props => [nama];
}

class RegisterEmailBerubahEvent extends RegisterEvent {
  final String email;
  const RegisterEmailBerubahEvent(this.email);
  List<Object> get props => [email];
}

class RegisterPasswordBerubahEvent extends RegisterEvent {
  final String password;
  const RegisterPasswordBerubahEvent(this.password);
  List<Object> get props => [password];
}

class RegisterKirimEvent extends RegisterEvent {}
