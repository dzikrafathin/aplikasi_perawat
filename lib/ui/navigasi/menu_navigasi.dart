import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';

class MenuNavigasi extends StatefulWidget {
  @override
  _MenuNavigasiState createState() => _MenuNavigasiState();
}

class _MenuNavigasiState extends State<MenuNavigasi> {
  void _pindahHalaman(PosisiHalaman posisiHalaman) {
    BlocProvider.of<NavigasiBloc>(context)
        .add(PindahHalamanEvent(posisiHalaman));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              _pindahHalaman(PosisiHalaman.dashboard);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profil'),
            onTap: () {
              _pindahHalaman(PosisiHalaman.profil);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

final menuNavigasi = MenuNavigasi();
