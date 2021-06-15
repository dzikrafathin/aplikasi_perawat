import 'package:aplikasi_perawat/model/pasien/pasien.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_perawat/bloc/bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pasien.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => HalamanTambahPasien()));
          BlocProvider.of<DaftarPasienBloc>(context)
              .add(MuatDaftarPasienEvent());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
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
                      return _ItemPasien(
                        pasien: state.daftarPasien[index],
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

class _ItemPasien extends StatelessWidget {
  final ItemPasienModel pasien;

  const _ItemPasien({
    required this.pasien,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.personal_injury,
        size: 35.0,
      ),
      title: Text(pasien.nama),
      subtitle: Text(pasien.noRm),
      trailing: Wrap(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await _konfirmasiHapus(context);
                BlocProvider.of<DaftarPasienBloc>(context)
                    .add(MuatDaftarPasienEvent());
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }

  Future<void> _konfirmasiHapus(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return BlocProvider<HapusPasienBloc>(
            create: (context) =>
                HapusPasienBloc(pasienApi: PasienApi(), idPasien: pasien.id),
            child: BlocListener<HapusPasienBloc, HapusPasienState>(
              child: AlertDialog(
                title: Text('Konfirmasi Hapus data Pasien'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Batal')),
                  // TextButton(onPressed: () {}, child: Text('Hapus'))
                  BlocBuilder<HapusPasienBloc, HapusPasienState>(
                      builder: (context, state) {
                    if (state is HapusPasienProsesState) {
                      return TextButton(
                          onPressed: null, child: CircularProgressIndicator());
                    } else {
                      return TextButton(
                          onPressed: () {
                            BlocProvider.of<HapusPasienBloc>(context)
                                .add(HapusPasienEvent());
                          },
                          child: Text('Hapus'));
                    }
                  })
                ],
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                          'Anda yakin ingin menghapus data Pasien dengan nama ${pasien.nama} ?'),
                      Text(
                          'Data Pasien yang sudah dihapus tidak dapat dikembalikan!')
                    ],
                  ),
                ),
              ),
              listener: (context, state) {
                if (state is HapusPasienBerhasilState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Data Pasien berhasil dihapus')));
                  Navigator.pop(context);
                } else if (state is HapusPasienGagalState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                            'Terjadi kesalahan ketika proses menghapus pasien')));
                }
              },
            ),
          );
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
