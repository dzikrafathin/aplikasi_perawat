import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:aplikasi_perawat/model/model.dart';
import 'package:aplikasi_perawat/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daftar_pasien_event.dart';
part 'daftar_pasien_state.dart';

class DaftarPasienBloc extends Bloc<DaftarPasienEvent, DaftarPasienState> {
  final PasienApi _pasienApi;
  DaftarPasienBloc({required PasienApi pasienApi})
      : _pasienApi = pasienApi,
        super(DaftarPasienState());

  @override
  Stream<DaftarPasienState> mapEventToState(DaftarPasienEvent event) async* {
    if (event is NoRmDicariBerubahEvent) {
      yield _mapNoRmDicariBerubahEventToState(event, state);
      add(MuatDaftarPasienEvent());
    } else if (event is MuatDaftarPasienEvent) {
      yield* _mapMuatDaftarPasienEventToState(event, state);
    }
  }

  DaftarPasienState _mapNoRmDicariBerubahEventToState(
      NoRmDicariBerubahEvent event, DaftarPasienState state) {
    return state.copyWith(cariNoRm: event.noRmDicari);
  }

  Stream<DaftarPasienState> _mapMuatDaftarPasienEventToState(
      event, DaftarPasienState state) async* {
    yield state.copyWith(status: DaftarPasienStatus.memuat);
    try {
      List<ItemPasienModel> daftarPasien =
          await _pasienApi.daftarPasien(noRm: state.cariNoRm);
      yield state.copyWith(
          status: DaftarPasienStatus.berhasil, daftarPasien: daftarPasien);
    } on DioError catch (_) {
      yield state.copyWith(status: DaftarPasienStatus.gagal);
    }
  }
}
