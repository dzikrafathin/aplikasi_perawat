import 'package:flutter/material.dart';
import 'package:aplikasi_perawat/bloc/askep/askep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buat_pasien_baru.dart';
import 'pilih_pasien_lama.dart';

class HalamanBuatAskep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuatAskepBloc, BuatAskepState>(
      builder: (context, state) {
        if (state is BuatPasienBaruState) {
          return HalamanBuatPasienBaru();
        } else if (state is PilihPasienLamaState) {
          return HalamanPilihPasienLama();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
