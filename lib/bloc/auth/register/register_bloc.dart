import 'package:aplikasi_perawat/model/model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthApi _authApi;

  RegisterBloc({required AuthApi authApi})
      : _authApi = authApi,
        super(RegisterState(status: RegisterStatus.mengisi));

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterNamaBerubahEvent) {
      yield _mapRegisterNamaBerubahEventToState(event, state);
    } else if (event is RegisterEmailBerubahEvent) {
      yield _mapRegisterEmailBerubahEventToState(event, state);
    } else if (event is RegisterPasswordBerubahEvent) {
      yield _mapRegisterPasswordBerubahEventToState(event, state);
    } else if (event is RegisterKirimEvent) {
      yield* _mapRegisterKirimEventToState(state);
    }
  }

  RegisterState _mapRegisterNamaBerubahEventToState(
      RegisterNamaBerubahEvent event, RegisterState state) {
    return state.copyWith(
        status: RegisterStatus.mengisi,
        registerErrorModel: state.registerErrorModel.copyWith(nama: ''),
        registerModel: state.registerModel.copyWith(nama: event.nama));
  }

  RegisterState _mapRegisterEmailBerubahEventToState(
      RegisterEmailBerubahEvent event, RegisterState state) {
    return state.copyWith(
        status: RegisterStatus.mengisi,
        registerErrorModel: state.registerErrorModel.copyWith(email: ''),
        registerModel: state.registerModel.copyWith(email: event.email));
  }

  RegisterState _mapRegisterPasswordBerubahEventToState(
      RegisterPasswordBerubahEvent event, RegisterState state) {
    return state.copyWith(
        status: RegisterStatus.mengisi,
        registerErrorModel: state.registerErrorModel.copyWith(password: ''),
        registerModel: state.registerModel.copyWith(password: event.password));
  }

  Stream<RegisterState> _mapRegisterKirimEventToState(
      RegisterState state) async* {
    yield state.copyWith(status: RegisterStatus.proses);
    try {
      final token = await _authApi.register(state.registerModel);
      yield state.copyWith(status: RegisterStatus.berhasil, token: token);
    } on DioError catch (e) {
      yield state.copyWith(
          status: RegisterStatus.gagal,
          registerErrorModel:
              RegisterErrorModel.fromJson(e.response!.data['errors']));
    }
  }
}
