import 'package:flutter/material.dart';

class HalamanLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login Akun Perawat',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(labelText: 'Alamat E-Mail'),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Login'))
        ],
      ),
    ));
  }
}
