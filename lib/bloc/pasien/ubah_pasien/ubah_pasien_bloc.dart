import 'package:aplikasi_perawat/model/pasien/pasien.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'ubah_pasien_event.dart';
part 'ubah_pasien_state.dart';

class UbahPasienBloc extends Bloc<UbahPasienEvent, UbahPasienState> {
  final int _idPasien;
  final PasienApi _pasienApi;
  UbahPasienBloc({required PasienApi pasienApi, required int idPasien})
      : _pasienApi = pasienApi,
        _idPasien = idPasien,
        super(UbahPasienState());

  @override
  Stream<UbahPasienState> mapEventToState(UbahPasienEvent event) async* {
    if (event is KirimPerubahanPasienEvent) {
      yield* _mapKirimPerubahanPasienEventToState(event, state);
    } else if (event is MuatPasienEvent) {
      yield* _mapMuatPasienEventToState(event, state);
    } else if (event is NamaPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(nama: ''),
          pasien: state.pasien.copyWith(nama: event.nama));
    } else if (event is NoRmPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(noRm: ''),
          pasien: state.pasien.copyWith(noRm: event.noRm));
    } else if (event is JenisKelaminPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(jenisKelamin: ''),
          pasien: state.pasien.copyWith(jenisKelamin: event.jenisKelamin));
    } else if (event is EmailPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(email: ''),
          pasien: state.pasien.copyWith(email: event.email));
    } else if (event is TempatLahirPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(tempatLahir: ''),
          pasien: state.pasien.copyWith(tempatLahir: event.tempatLahir));
    } else if (event is TglLahirPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(tanggalLahir: ''),
          pasien: state.pasien.copyWith(tanggalLahir: event.tglLahir));
    } else if (event is AlamatPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(alamat: ''),
          pasien: state.pasien.copyWith(alamat: event.alamat));
    } else if (event is NoHpPasienUbahBerubahEvent) {
      yield state.copyWith(
          status: UbahPasienStatus.mengisi,
          pasienError: state.pasienError.copyWith(noHp: ''),
          pasien: state.pasien.copyWith(noHp: event.noHp));
    }
  }

  Stream<UbahPasienState> _mapKirimPerubahanPasienEventToState(
      KirimPerubahanPasienEvent event, UbahPasienState state) async* {
    yield state.copyWith(status: UbahPasienStatus.mengirim);
    try {
      await _pasienApi.updatePasien(_idPasien, state.pasien);
      yield state.copyWith(status: UbahPasienStatus.berhasilMengirim);
    } on DioError catch (e) {
      yield state.copyWith(
          pasienError: PasienErrorModel.fromJson(e.response!.data['errors']),
          status: UbahPasienStatus.gagalMengirim);
    }
  }

  Stream<UbahPasienState> _mapMuatPasienEventToState(
      MuatPasienEvent event, UbahPasienState state) async* {
    yield state.copyWith(status: UbahPasienStatus.memuat);
    try {
      PasienModel pasien = await _pasienApi.showPasien(_idPasien);
      yield state.copyWith(
          status: UbahPasienStatus.berhasilMemuat, pasien: pasien);
    } on DioError catch (_) {
      yield state.copyWith(status: UbahPasienStatus.gagalMemuat);
    }
  }
}
