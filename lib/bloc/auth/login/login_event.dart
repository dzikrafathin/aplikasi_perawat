part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object> get props => [];
}

class LoginEmailBerubahEvent extends LoginEvent {
  final String email;
  const LoginEmailBerubahEvent(this.email);
  List<Object> get props => [email];
}

class LoginPasswordBerubahEvent extends LoginEvent {
  final String password;
  const LoginPasswordBerubahEvent(this.password);
  List<Object> get props => [password];
}

class LoginKirimEvent extends LoginEvent {}

// class LoginGagalEvent extends LoginEvent {
//   final LoginErrorModel loginErrorModel;
//   const LoginGagalEvent(this.loginErrorModel);
//   List<Object> get props => [loginErrorModel];
// }

// class LoginBerhasilEvent extends LoginEvent {
//   final String token;
//   const LoginBerhasilEvent(this.token);
//   List<Object> get props => [token];
// }
