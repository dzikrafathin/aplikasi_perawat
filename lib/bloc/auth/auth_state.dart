part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final String token;
  const AuthState({this.token = ''});

  @override
  List<Object> get props => [token];
}

class BelumLoginState extends AuthState {
  const BelumLoginState() : super(token: '');
}

class SudahLoginState extends AuthState {
  const SudahLoginState({String token = ''}) : super(token: token);
}

class GagalLoginState extends AuthState {
  const GagalLoginState() : super(token: '');
}

class ProsesLoginState extends AuthState {
  const ProsesLoginState() : super(token: '');
}

class ProsesLogoutState extends AuthState {
  const ProsesLogoutState({String token = ''}) : super(token: token);
}
