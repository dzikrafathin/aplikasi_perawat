part of 'pasien_baru_bloc.dart';

enum PasienBaruStatus { mengisi, mengirim, berhasil, gagal }

class PasienBaruState extends Equatable {
  final PasienBaruStatus status;
  final PasienModel pasienBaru;
  final PasienErrorModel pasienBaruError;
  const PasienBaruState(
      {this.status = PasienBaruStatus.mengisi,
      this.pasienBaru = const PasienModel(),
      this.pasienBaruError = const PasienErrorModel()});

  PasienBaruState copyWith(
      {PasienBaruStatus? status,
      PasienModel? pasienBaru,
      PasienErrorModel? pasienBaruError}) {
    return PasienBaruState(
        status: status ?? this.status,
        pasienBaru: pasienBaru ?? this.pasienBaru,
        pasienBaruError: pasienBaruError ?? this.pasienBaruError);
  }

  List<Object> get props => [status, pasienBaru, pasienBaruError];
}
