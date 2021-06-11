import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is ProsesLoginEvent) {
      yield _mapProsesLoginEventToState(state);
    } else if (event is GagalLoginEvent) {
      yield _mapGagalLoginEventToState(state);
    } else if (event is BerhasilLoginEvent) {
      yield _mapBerhasilLoginEventToState(event, state);
    }

    throw UnimplementedError();
  }

  ProsesLoginState _mapProsesLoginEventToState(AuthState state) {
    if (state is BelumLoginState) {
      return ProsesLoginState();
    } else {
      throw Exception('Perubahan tidak valid! Seharusnya status Belum Login');
    }
  }

  GagalLoginState _mapGagalLoginEventToState(AuthState state) {
    if (state is ProsesLoginState) {
      return GagalLoginState();
    } else {
      throw Exception('Perubahan tidak valid! Seharusnya status Proses Login');
    }
  }

  SudahLoginState _mapBerhasilLoginEventToState(
      BerhasilLoginEvent event, AuthState state) {
    if (state is ProsesLoginState) {
      return SudahLoginState(token: event.token);
    } else {
      throw Exception('Perubahan tidak valid! Seharusnya status Proses Login');
    }
  }
}
