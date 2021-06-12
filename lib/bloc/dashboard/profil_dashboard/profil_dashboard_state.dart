part of 'profil_dashboard_bloc.dart';

enum ProfilDashboardStatus { proses, berhasil, gagal }

class ProfilDashboardState extends Equatable {
  final ProfilDashboardStatus status;
  final String nama;
  final String email;
  final String foto;

  const ProfilDashboardState(
      {this.status = ProfilDashboardStatus.gagal,
      this.nama = '',
      this.email = '',
      this.foto = ''});

  ProfilDashboardState copyWith(
      {ProfilDashboardStatus? status,
      String? nama,
      String? email,
      String? foto}) {
    return ProfilDashboardState(
        status: status ?? this.status,
        nama: nama ?? this.email,
        foto: foto ?? this.foto,
        email: email ?? this.email);
  }

  List<Object> get props => [nama, email, foto];
}
