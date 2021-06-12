part of 'login_bloc.dart';

enum LoginStatus { mengisi, proses, berhasil, gagal }

class LoginState extends Equatable {
  final LoginModel loginModel;
  final LoginStatus status;
  final LoginErrorModel loginErrorModel;
  final String token;

  LoginState copyWith(
      {LoginModel? loginModel,
      LoginStatus? status,
      LoginErrorModel? loginErrorModel,
      String? token}) {
    return LoginState(
        token: token ?? this.token,
        loginModel: loginModel ?? this.loginModel,
        status: status ?? this.status,
        loginErrorModel: loginErrorModel ?? this.loginErrorModel);
  }

  const LoginState(
      {this.token = '',
      this.status = LoginStatus.mengisi,
      this.loginModel = const LoginModel(),
      this.loginErrorModel = const LoginErrorModel()});
  List<Object> get props => [loginModel, status, loginErrorModel, token];
}
