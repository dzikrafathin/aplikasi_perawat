import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui.dart';
import '../../bloc/bloc.dart';

class HalamanNavigasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigasiBloc, NavigasiState>(
        bloc: BlocProvider.of<NavigasiBloc>(context),
        builder: (context, state) {
          switch (state.posisiHalaman) {
            case PosisiHalaman.dashboard:
              return HalamanDashboard();
            case PosisiHalaman.profil:
              return HalamanProfil();
          }
        });
  }
}
