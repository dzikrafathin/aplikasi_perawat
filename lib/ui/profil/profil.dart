import 'package:aplikasi_perawat/ui/ui.dart';
import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuNavigasi,
      appBar: AppBar(
        title: Text('Profil Perawat'),
      ),
    );
  }
}
