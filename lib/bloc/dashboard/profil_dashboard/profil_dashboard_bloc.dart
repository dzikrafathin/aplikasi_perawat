import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'profil_dashboard_event.dart';
part 'profil_dashboard_state.dart';

class ProfilDashboardBloc
    extends Bloc<ProfilDashboardEvent, ProfilDashboardState> {
  final ProfilPerawatApi _profilPerawatApi;
  ProfilDashboardBloc({required ProfilPerawatApi profilPerawatApi})
      : _profilPerawatApi = profilPerawatApi,
        super(ProfilDashboardState());

  @override
  Stream<ProfilDashboardState> mapEventToState(
      ProfilDashboardEvent event) async* {
    if (event is MuatProfilDashboardEvent) {
      yield* _mapMuatProfilDashboardEvent(state);
    }
  }

  Stream<ProfilDashboardState> _mapMuatProfilDashboardEvent(
      ProfilDashboardState state) async* {
    yield state.copyWith(status: ProfilDashboardStatus.proses);
    try {
      final hasil = await _profilPerawatApi.getProfil();
      yield state.copyWith(
          status: ProfilDashboardStatus.berhasil,
          nama: hasil['nama'],
          email: hasil['email'],
          foto: hasil['foto']);
    } on DioError catch (_) {
      yield state.copyWith(status: ProfilDashboardStatus.gagal);
    }
  }
}
