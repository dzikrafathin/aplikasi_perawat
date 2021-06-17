import 'package:aplikasi_perawat/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/bloc/bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

class HalamanDaftarAskep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasien yang dirawat'),
      ),
      body: BlocProvider<DaftarAskepBloc>(
        create: (context) =>
            DaftarAskepBloc(askepApi: AskepApi())..add(MuatDaftarAskepEvent()),
        child: _LogicDaftarAskep(),
      ),
    );
  }
}

class _LogicDaftarAskep extends StatelessWidget {
  const _LogicDaftarAskep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarAskepBloc, DaftarAskepState>(
        bloc: BlocProvider.of<DaftarAskepBloc>(context),
        builder: (context, state) {
          switch (state.status) {
            case DaftarAskepStatus.berhasil:
              return _DaftarAskep(daftarAskep: state.daftarAskep);
            case DaftarAskepStatus.gagal:
              return Center(
                child: Text('Terjadi kesalahan saat memuat data'),
              );
            case DaftarAskepStatus.memuat:
              return Center(
                child: CircularProgressIndicator(),
              );
            case DaftarAskepStatus.tidakDiketahui:
              return Center(
                child: Text('Tidak diketahui'),
              );
          }
        });
    // return ListView(
    //   children: [_ItemAskep()],
    // );
  }
}

class _DaftarAskep extends StatelessWidget {
  final List<ItemAskepModel> daftarAskep;

  const _DaftarAskep({
    required this.daftarAskep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daftarAskep.length,
      itemBuilder: (context, index) {
        return _ItemAskep(
          itemAskep: daftarAskep[index],
        );
      },
    );
  }
}

class _ItemAskep extends StatelessWidget {
  final ItemAskepModel itemAskep;
  const _ItemAskep({
    required this.itemAskep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.personal_injury),
      title: Text(itemAskep.pasien.nama),
      subtitle: Text(itemAskep.pasien.noRm),
    );
  }
}
