part of 'buat_askep_bloc.dart';

abstract class BuatAskepEvent extends Equatable {
  const BuatAskepEvent();
  List<Object> get props => [];
}

class MulaiBuatPasienBaruEvent extends BuatAskepEvent {}

class MulaiPilihPasienLamaEvent extends BuatAskepEvent {}

class PasienDipilihEvent extends BuatAskepEvent {
  final PasienModel pasien;
  const PasienDipilihEvent(this.pasien);
  List<Object> get props => [pasien];
}
