part of 'pasien_baru_bloc.dart';

abstract class PasienBaruEvent extends Equatable {
  const PasienBaruEvent();
  List<Object> get props => [];
}

class NoRmPasienBerubahEvent extends PasienBaruEvent {
  final String noRm;
  const NoRmPasienBerubahEvent(this.noRm);
  List<Object> get props => [noRm];
}

class NamaPasienBerubahEvent extends PasienBaruEvent {
  final String nama;
  const NamaPasienBerubahEvent(this.nama);
  List<Object> get props => [nama];
}

class JenisKelaminPasienBerubahEvent extends PasienBaruEvent {
  final int jenisKelamin;
  const JenisKelaminPasienBerubahEvent(this.jenisKelamin);
  List<Object> get props => [jenisKelamin];
}

class EmailPasienBerubahEvent extends PasienBaruEvent {
  final String email;
  const EmailPasienBerubahEvent(this.email);
  List<Object> get props => [email];
}

class NoHpPasienBerubahEvent extends PasienBaruEvent {
  final String noHp;
  const NoHpPasienBerubahEvent(this.noHp);
  List<Object> get props => [noHp];
}

class TglLahirPasienBerubahEvent extends PasienBaruEvent {
  final String tglLahir;
  const TglLahirPasienBerubahEvent(this.tglLahir);
  List<Object> get props => [tglLahir];
}

class TempatLahirPasienBerubahEvent extends PasienBaruEvent {
  final String tempatLahir;
  const TempatLahirPasienBerubahEvent(this.tempatLahir);
  List<Object> get props => [tempatLahir];
}

class AlamatPasienBerubahEvent extends PasienBaruEvent {
  final String alamat;
  const AlamatPasienBerubahEvent(this.alamat);
  List<Object> get props => [alamat];
}

class KirimPasienBaruEvent extends PasienBaruEvent {}
