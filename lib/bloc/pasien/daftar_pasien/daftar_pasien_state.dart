part of 'daftar_pasien_bloc.dart';

enum DaftarPasienStatus { tidakDiketauhui, memuat, berhasil, gagal }

class DaftarPasienState extends Equatable {
  final DaftarPasienStatus status;
  final List<ItemPasienModel> daftarPasien;
  final String cariNoRm;
  const DaftarPasienState(
      {this.status = DaftarPasienStatus.tidakDiketauhui,
      this.daftarPasien = const [],
      this.cariNoRm = ''});

  DaftarPasienState copyWith(
      {DaftarPasienStatus? status,
      List<ItemPasienModel>? daftarPasien,
      String? cariNoRm}) {
    return DaftarPasienState(
        status: status ?? this.status,
        daftarPasien: daftarPasien ?? this.daftarPasien,
        cariNoRm: cariNoRm ?? this.cariNoRm);
  }

  List<Object> get props => [cariNoRm, status, daftarPasien];
}
