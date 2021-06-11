import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:aplikasi_perawat/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApi _authApi;

  LoginBloc({required AuthApi authApi})
      : _authApi = authApi,
        super(LoginState(status: LoginStatus.mengisi));

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailBerubahEvent) {
      yield _mapLoginEmailBerubahEventToState(event, state);
    } else if (event is LoginPasswordBerubahEvent) {
      yield _mapLoginPasswordBerubahEventToState(event, state);
    } else if (event is LoginKirimEvent) {
      yield* _mapLoginKirimEventToState(state);
    }
  }

  LoginState _mapLoginEmailBerubahEventToState(
      LoginEmailBerubahEvent event, LoginState state) {
    return state.copyWith(
        status: LoginStatus.mengisi,
        loginErrorModel: state.loginErrorModel.copyWith(email: ''),
        loginModel: state.loginModel.copyWith(email: event.email));
  }

  LoginState _mapLoginPasswordBerubahEventToState(
      LoginPasswordBerubahEvent event, LoginState state) {
    return state.copyWith(
        status: LoginStatus.mengisi,
        loginErrorModel: state.loginErrorModel.copyWith(password: ''),
        loginModel: state.loginModel.copyWith(password: event.password));
  }

  Stream<LoginState> _mapLoginKirimEventToState(LoginState state) async* {
    yield state.copyWith(status: LoginStatus.proses);
    try {
      final token = await _authApi.login(state.loginModel);
      yield state.copyWith(status: LoginStatus.berhasil, token: token);
    } on DioError catch (e) {
      yield state.copyWith(
          status: LoginStatus.gagal,
          loginErrorModel:
              LoginErrorModel.fromJson(e.response!.data['errors']));
    }
  }
}
