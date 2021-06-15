part of 'ubah_pasien_bloc.dart';

abstract class UbahPasienEvent extends Equatable {
  const UbahPasienEvent();
  List<Object> get props => [];
}

class NoRmPasienUbahBerubahEvent extends UbahPasienEvent {
  final String noRm;
  const NoRmPasienUbahBerubahEvent(this.noRm);
  List<Object> get props => [noRm];
}

class NamaPasienUbahBerubahEvent extends UbahPasienEvent {
  final String nama;
  const NamaPasienUbahBerubahEvent(this.nama);
  List<Object> get props => [nama];
}

class JenisKelaminPasienUbahBerubahEvent extends UbahPasienEvent {
  final int jenisKelamin;
  const JenisKelaminPasienUbahBerubahEvent(this.jenisKelamin);
  List<Object> get props => [jenisKelamin];
}

class EmailPasienUbahBerubahEvent extends UbahPasienEvent {
  final String email;
  const EmailPasienUbahBerubahEvent(this.email);
  List<Object> get props => [email];
}

class NoHpPasienUbahBerubahEvent extends UbahPasienEvent {
  final String noHp;
  const NoHpPasienUbahBerubahEvent(this.noHp);
  List<Object> get props => [noHp];
}

class TglLahirPasienUbahBerubahEvent extends UbahPasienEvent {
  final String tglLahir;
  const TglLahirPasienUbahBerubahEvent(this.tglLahir);
  List<Object> get props => [tglLahir];
}

class TempatLahirPasienUbahBerubahEvent extends UbahPasienEvent {
  final String tempatLahir;
  const TempatLahirPasienUbahBerubahEvent(this.tempatLahir);
  List<Object> get props => [tempatLahir];
}

class AlamatPasienUbahBerubahEvent extends UbahPasienEvent {
  final String alamat;
  const AlamatPasienUbahBerubahEvent(this.alamat);
  List<Object> get props => [alamat];
}

class MuatPasienEvent extends UbahPasienEvent {}

class KirimPerubahanPasienEvent extends UbahPasienEvent {}
