part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  List<Object> get props => [];
}

class InisialisasiAwalEvent extends AuthEvent {}

class BerhasilLoginEvent extends AuthEvent {
  final String token;
  const BerhasilLoginEvent(this.token);
  List<Object> get props => [token];
}

class BerhasilLogoutEvent extends AuthEvent {}
