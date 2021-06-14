import 'package:flutter/material.dart';
import 'package:aplikasi_perawat/bloc/bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalamanDaftarPasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DaftarPasienBloc>(
        create: (context) => DaftarPasienBloc(pasienApi: PasienApi()),
        child: _ScaffoldDaftarPasien());
  }
}

class _ScaffoldDaftarPasien extends StatefulWidget {
  @override
  _ScaffoldDaftarPasienState createState() => _ScaffoldDaftarPasienState();
}

class _ScaffoldDaftarPasienState extends State<_ScaffoldDaftarPasien> {
  bool sedangMencari = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Daftar Pasien'),
        title: sedangMencari ? _KotakPencarian() : Text('Daftar Pasien'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (sedangMencari) {
                    sedangMencari = false;
                  } else {
                    sedangMencari = true;
                  }
                });
              },
              icon: Icon(sedangMencari ? Icons.close : Icons.search))
        ],
      ),
      body: _DaftarPasien(),
    );
  }
}

class _DaftarPasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarPasienBloc, DaftarPasienState>(
        bloc: BlocProvider.of<DaftarPasienBloc>(context)
          ..add(MuatDaftarPasienEvent()),
        builder: (context, state) {
          switch (state.status) {
            case DaftarPasienStatus.berhasil:
              if (state.daftarPasien.length > 0) {
                return ListView.builder(
                    itemCount: state.daftarPasien.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.account_box,
                          size: 35.0,
                        ),
                        title: Text(state.daftarPasien[index].nama),
                        subtitle: Text(state.daftarPasien[index].noRm),
                      );
                    });
              } else {
                return Center(
                  child: Text('Belum ada data pasien'),
                );
              }
            case DaftarPasienStatus.gagal:
              return Center(
                child: Text('Terjadi kesalahan saat memuat Daftar Pasien'),
              );
            case DaftarPasienStatus.memuat:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Center(
                child: Text('Tidak diketahui'),
              );
          }
        });
  }
}

class _KotakPencarian extends StatelessWidget {
  const _KotakPencarian({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (noRm) {
        BlocProvider.of<DaftarPasienBloc>(context)
            .add(NoRmDicariBerubahEvent(noRm));
      },
      decoration: InputDecoration(hintText: 'Masukan Nomor RM pasien'),
    );
  }
}
