part of 'navigasi_bloc.dart';

enum PosisiHalaman { dashboard, profil }

class NavigasiState extends Equatable {
  final PosisiHalaman posisiHalaman;
  const NavigasiState(this.posisiHalaman);
  List<Object> get props => [posisiHalaman];
}
