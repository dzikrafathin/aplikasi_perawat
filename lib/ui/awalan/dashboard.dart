import 'package:flutter/material.dart';
import '../ui.dart';

class HalamanDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuNavigasi,
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
    );
  }
}
