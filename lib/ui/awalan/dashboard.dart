import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui.dart';
import '../../bloc/bloc.dart';
import '../../api/api.dart';

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        children: [
          _ProfilPerawat(),
          Row(
            children: [
              _TombolDashboard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanBuatAskep()));
                },
                icon: Icons.person_add_alt,
                text: 'Rawat Pasien Lama',
                size: 40,
              ),
              _TombolDashboard(
                onTap: () {},
                text: 'Rawat Pasien Baru',
                icon: Icons.person_add,
                size: 40,
              ),
              // _TombolDashboard(
              //     onTap: () {},
              //     text: 'Daftar Pasien',
              //     icon: Icons.personal_injury),
            ],
          ),
          Row(
            children: [
              _TombolDashboard(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanDaftarPasien()));
                },
                icon: Icons.personal_injury,
                text: 'Daftar Pasien',
                size: 40,
              ),
              _TombolDashboard(
                onTap: () {},
                text: 'Buku Keperawatan',
                icon: Icons.book,
                size: 40,
              ),
              // _TombolDashboard(
              //     onTap: () {},
              //     text: 'Daftar Pasien',
              //     icon: Icons.personal_injury),
            ],
          )
        ],
      ),
    );
  }
}

class _TombolDashboard extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String text;
  final double? size;

  const _TombolDashboard({
    this.size,
    this.onTap,
    this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: InkWell(
          onTap: this.onTap,
          child: Column(
            children: [
              Icon(
                this.icon,
                size: size,
              ),
              Text(this.text)
            ],
          ),
        ),
      ),
    ));
  }
}

class _ProfilPerawat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilDashboardBloc>(
      create: (context) =>
          ProfilDashboardBloc(profilPerawatApi: ProfilPerawatApi())
            ..add(MuatProfilDashboardEvent()),
      child: BlocBuilder<ProfilDashboardBloc, ProfilDashboardState>(
        builder: (context, state) {
          switch (state.status) {
            case ProfilDashboardStatus.berhasil:
              return Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 50.0,
                  ),
                  title: Text(
                    state.nama,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    state.email,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ));

            case ProfilDashboardStatus.gagal:
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Terjadi Kesalahan!'),
                ),
              );
            case ProfilDashboardStatus.proses:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
