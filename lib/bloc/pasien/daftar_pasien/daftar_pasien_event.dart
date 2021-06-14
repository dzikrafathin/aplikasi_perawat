part of 'daftar_pasien_bloc.dart';

abstract class DaftarPasienEvent extends Equatable {
  const DaftarPasienEvent();
  List<Object> get props => [];
}

class NoRmDicariBerubahEvent extends DaftarPasienEvent {
  final String noRmDicari;
  const NoRmDicariBerubahEvent(this.noRmDicari);
  List<Object> get props => [noRmDicari];
}

class MuatDaftarPasienEvent extends DaftarPasienEvent {}
