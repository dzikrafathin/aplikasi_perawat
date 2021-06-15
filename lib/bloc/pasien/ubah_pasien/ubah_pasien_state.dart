part of 'ubah_pasien_bloc.dart';

enum UbahPasienStatus {
  mengisi,
  mengirim,
  memuat,
  berhasilMemuat,
  berhasilMengirim,
  gagalMemuat,
  gagalMengirim
}

class UbahPasienState extends Equatable {
  final UbahPasienStatus status;
  final PasienModel pasien;
  final PasienErrorModel pasienError;
  const UbahPasienState(
      {this.status = UbahPasienStatus.mengisi,
      this.pasien = const PasienModel(),
      this.pasienError = const PasienErrorModel()});

  UbahPasienState copyWith(
      {UbahPasienStatus? status,
      PasienModel? pasien,
      PasienErrorModel? pasienError}) {
    return UbahPasienState(
        status: status ?? this.status,
        pasien: pasien ?? this.pasien,
        pasienError: pasienError ?? this.pasienError);
  }

  List<Object> get props => [status, pasien, pasienError];
}
