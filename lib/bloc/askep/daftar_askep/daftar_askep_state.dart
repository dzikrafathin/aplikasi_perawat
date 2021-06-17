part of 'daftar_askep_bloc.dart';

enum DaftarAskepStatus { memuat, berhasil, gagal, tidakDiketahui }

class DaftarAskepState extends Equatable {
  final DaftarAskepStatus status;
  final List<ItemAskepModel> daftarAskep;
  const DaftarAskepState({required this.status, required this.daftarAskep});

  DaftarAskepState copyWith(
      {DaftarAskepStatus? status, List<ItemAskepModel>? daftarAskep}) {
    return DaftarAskepState(
        status: status ?? this.status,
        daftarAskep: daftarAskep ?? this.daftarAskep);
  }

  List<Object> get props => [status, daftarAskep];
}
