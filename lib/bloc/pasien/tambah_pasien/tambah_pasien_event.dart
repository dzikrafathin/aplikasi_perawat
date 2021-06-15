part of 'tambah_pasien_bloc.dart';

abstract class TambahPasienEvent extends Equatable {
  const TambahPasienEvent();
  List<Object> get props => [];
}

class NoRmPasienBerubahEvent extends TambahPasienEvent {
  final String noRm;
  const NoRmPasienBerubahEvent(this.noRm);
  List<Object> get props => [noRm];
}

class NamaPasienBerubahEvent extends TambahPasienEvent {
  final String nama;
  const NamaPasienBerubahEvent(this.nama);
  List<Object> get props => [nama];
}

class JenisKelaminPasienBerubahEvent extends TambahPasienEvent {
  final int jenisKelamin;
  const JenisKelaminPasienBerubahEvent(this.jenisKelamin);
  List<Object> get props => [jenisKelamin];
}

class EmailPasienBerubahEvent extends TambahPasienEvent {
  final String email;
  const EmailPasienBerubahEvent(this.email);
  List<Object> get props => [email];
}

class NoHpPasienBerubahEvent extends TambahPasienEvent {
  final String noHp;
  const NoHpPasienBerubahEvent(this.noHp);
  List<Object> get props => [noHp];
}

class TglLahirPasienBerubahEvent extends TambahPasienEvent {
  final String tglLahir;
  const TglLahirPasienBerubahEvent(this.tglLahir);
  List<Object> get props => [tglLahir];
}

class TempatLahirPasienBerubahEvent extends TambahPasienEvent {
  final String tempatLahir;
  const TempatLahirPasienBerubahEvent(this.tempatLahir);
  List<Object> get props => [tempatLahir];
}

class AlamatPasienBerubahEvent extends TambahPasienEvent {
  final String alamat;
  const AlamatPasienBerubahEvent(this.alamat);
  List<Object> get props => [alamat];
}

class KirimPasienBaruEvent extends TambahPasienEvent {}
