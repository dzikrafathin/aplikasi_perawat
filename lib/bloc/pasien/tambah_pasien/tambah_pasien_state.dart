part of 'tambah_pasien_bloc.dart';

enum TambahPasienStatus { mengisi, mengirim, berhasil, gagal }

class TambahPasienState extends Equatable {
  final TambahPasienStatus status;
  final PasienModel pasienBaru;
  final PasienErrorModel pasienBaruError;
  const TambahPasienState(
      {this.status = TambahPasienStatus.mengisi,
      this.pasienBaru = const PasienModel(),
      this.pasienBaruError = const PasienErrorModel()});

  TambahPasienState copyWith(
      {TambahPasienStatus? status,
      PasienModel? pasienBaru,
      PasienErrorModel? pasienBaruError}) {
    return TambahPasienState(
        status: status ?? this.status,
        pasienBaru: pasienBaru ?? this.pasienBaru,
        pasienBaruError: pasienBaruError ?? this.pasienBaruError);
  }

  List<Object> get props => [status, pasienBaru, pasienBaruError];
}
