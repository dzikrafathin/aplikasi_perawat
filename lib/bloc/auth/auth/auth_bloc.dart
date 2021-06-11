import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is InisialisasiAwalEvent) {
      yield await _mapInisialisasiAwalEventToState(state);
    } else if (event is BerhasilLoginEvent) {
      yield _mapBerhasilLoginEventToState(event, state);
    }
  }

  SudahLoginState _mapBerhasilLoginEventToState(
      BerhasilLoginEvent event, AuthState state) {
    if (state is BelumLoginState) {
      return SudahLoginState(token: event.token);
    } else {
      throw Exception('Perubahan tidak valid! Seharusnya state Belum Login');
    }
  }

  Future<AuthState> _mapInisialisasiAwalEventToState(AuthState state) async {
    if (state is TidakDiketahuiState) {
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');
      if (token != null) {
        return SudahLoginState(token: token);
      } else {
        return BelumLoginState();
      }
    } else {
      throw Exception(
          'Perubahan tidak valid! Seharusnya state Tidak Diketahui');
    }
  }
}
