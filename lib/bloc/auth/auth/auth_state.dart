part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final String token;
  const AuthState({this.token = ''});

  @override
  List<Object> get props => [token];
}

class TidakDiketahuiState extends AuthState {}

class BelumLoginState extends AuthState {
  const BelumLoginState() : super(token: '');
}

class SudahLoginState extends AuthState {
  const SudahLoginState({String token = ''}) : super(token: token);
}
