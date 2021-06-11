part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  List<Object> get props => [];
}

class ProsesLoginEvent extends AuthEvent {}

class GagalLoginEvent extends AuthEvent {}

class BerhasilLoginEvent extends AuthEvent {
  final String token;
  const BerhasilLoginEvent(this.token);
  List<Object> get props => [token];
}

class ProsesLogoutEvent extends AuthEvent {}

class GagalLogoutEvent extends AuthEvent {}

class BerhasilLogoutEvent extends AuthEvent {}
