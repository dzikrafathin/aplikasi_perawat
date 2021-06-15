part of 'hapus_pasien_bloc.dart';

abstract class HapusPasienState extends Equatable {
  const HapusPasienState();
  List<Object> get props => [];
}

class HapusPasienAwalState extends HapusPasienState {}

class HapusPasienProsesState extends HapusPasienState {}

class HapusPasienGagalState extends HapusPasienState {}

class HapusPasienBerhasilState extends HapusPasienState {}
