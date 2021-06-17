part of 'daftar_askep_bloc.dart';

abstract class DaftarAskepEvent extends Equatable {
  const DaftarAskepEvent();
  List<Object> get props => [];
}

class MuatDaftarAskepEvent extends DaftarAskepEvent {}
