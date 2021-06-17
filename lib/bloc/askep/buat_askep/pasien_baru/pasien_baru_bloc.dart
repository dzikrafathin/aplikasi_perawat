import 'package:aplikasi_perawat/model/pasien/pasien.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'pasien_baru_event.dart';
part 'pasien_baru_state.dart';

class PasienBaruBloc extends Bloc<PasienBaruEvent, PasienBaruState> {
  final PasienApi _pasienApi;
  PasienBaruBloc({required PasienApi pasienApi})
      : _pasienApi = pasienApi,
        super(PasienBaruState());

  @override
  Stream<PasienBaruState> mapEventToState(PasienBaruEvent event) async* {
    if (event is KirimPasienBaruEvent) {
      yield* _mapKirimPasienBaruEventToState(event, state);
    } else if (event is NamaPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(nama: ''),
          pasienBaru: state.pasienBaru.copyWith(nama: event.nama));
    } else if (event is NoRmPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(noRm: ''),
          pasienBaru: state.pasienBaru.copyWith(noRm: event.noRm));
    } else if (event is JenisKelaminPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(jenisKelamin: ''),
          pasienBaru:
              state.pasienBaru.copyWith(jenisKelamin: event.jenisKelamin));
    } else if (event is EmailPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(email: ''),
          pasienBaru: state.pasienBaru.copyWith(email: event.email));
    } else if (event is TempatLahirPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(tempatLahir: ''),
          pasienBaru:
              state.pasienBaru.copyWith(tempatLahir: event.tempatLahir));
    } else if (event is TglLahirPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(tanggalLahir: ''),
          pasienBaru: state.pasienBaru.copyWith(tanggalLahir: event.tglLahir));
    } else if (event is AlamatPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(alamat: ''),
          pasienBaru: state.pasienBaru.copyWith(alamat: event.alamat));
    } else if (event is NoHpPasienBerubahEvent) {
      yield state.copyWith(
          status: PasienBaruStatus.mengisi,
          pasienBaruError: state.pasienBaruError.copyWith(noHp: ''),
          pasienBaru: state.pasienBaru.copyWith(noHp: event.noHp));
    }
  }

  Stream<PasienBaruState> _mapKirimPasienBaruEventToState(
      KirimPasienBaruEvent event, PasienBaruState state) async* {
    yield state.copyWith(status: PasienBaruStatus.mengirim);
    try {
      PasienModel pasienBaru = await _pasienApi.storePasien(state.pasienBaru);
      yield state.copyWith(
          status: PasienBaruStatus.berhasil, pasienBaru: pasienBaru);
    } on DioError catch (e) {
      yield state.copyWith(
          pasienBaruError:
              PasienErrorModel.fromJson(e.response!.data['errors']),
          status: PasienBaruStatus.gagal);
    }
  }
}
