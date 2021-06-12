import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import '../ui.dart';
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
        children: [_ProfilPerawat()],
      ),
    );
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
