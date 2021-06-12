part of 'navigasi_bloc.dart';

abstract class NavigasiEvent extends Equatable {
  const NavigasiEvent();
  List<Object> get props => [];
}

class PindahHalamanEvent extends NavigasiEvent {
  final PosisiHalaman tujuan;
  const PindahHalamanEvent(this.tujuan);
  List<Object> get props => [tujuan];
}
