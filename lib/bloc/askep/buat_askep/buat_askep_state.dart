part of 'buat_askep_bloc.dart';

abstract class BuatAskepState extends Equatable {
  const BuatAskepState();
  List<Object> get props => [];
}

class BuatAskepTidakDiketahuiState extends BuatAskepState {}

class BuatPasienBaruState extends BuatAskepState {}

class PilihPasienLamaState extends BuatAskepState {}

class PasienDipilihState extends BuatAskepState {
  final PasienModel pasien;
  const PasienDipilihState(this.pasien);
  List<Object> get props => [pasien];
}

class AskepTelahDibuatState extends BuatAskepState {
  final int idAskep;
  final PasienModel pasien;
  const AskepTelahDibuatState({required this.idAskep, required this.pasien});
  List<Object> get props => [idAskep, pasien];
}
