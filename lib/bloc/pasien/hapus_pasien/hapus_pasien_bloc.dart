import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

part 'hapus_pasien_event.dart';
part 'hapus_pasien_state.dart';

class HapusPasienBloc extends Bloc<HapusPasienEvent, HapusPasienState> {
  final int _idPasien;
  final PasienApi _pasienApi;
  HapusPasienBloc({required PasienApi pasienApi, required int idPasien})
      : _pasienApi = pasienApi,
        _idPasien = idPasien,
        super(HapusPasienAwalState());

  @override
  Stream<HapusPasienState> mapEventToState(HapusPasienEvent event) async* {
    yield HapusPasienProsesState();
    try {
      await _pasienApi.destroyPasien(_idPasien);
      yield HapusPasienBerhasilState();
    } on DioError catch (_) {
      yield HapusPasienGagalState();
    }
  }
}
