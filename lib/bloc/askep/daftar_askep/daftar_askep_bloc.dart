import 'package:aplikasi_perawat/api/api.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:aplikasi_perawat/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daftar_askep_event.dart';
part 'daftar_askep_state.dart';

class DaftarAskepBloc extends Bloc<DaftarAskepEvent, DaftarAskepState> {
  final AskepApi _askepApi;
  DaftarAskepBloc({required AskepApi askepApi})
      : _askepApi = askepApi,
        super(DaftarAskepState(
            status: DaftarAskepStatus.tidakDiketahui, daftarAskep: []));

  @override
  Stream<DaftarAskepState> mapEventToState(DaftarAskepEvent event) async* {
    if (event is MuatDaftarAskepEvent) {
      yield* _mapMuatDaftarAskepEventToState(event, state);
    }
  }

  Stream<DaftarAskepState> _mapMuatDaftarAskepEventToState(
      MuatDaftarAskepEvent event, DaftarAskepState state) async* {
    yield state.copyWith(status: DaftarAskepStatus.memuat);
    try {
      List<ItemAskepModel> daftarAskep = await _askepApi.daftarAskep();
      yield state.copyWith(
          status: DaftarAskepStatus.berhasil, daftarAskep: daftarAskep);
    } on DioError catch (_) {
      yield state.copyWith(status: DaftarAskepStatus.gagal);
    }
  }
}
