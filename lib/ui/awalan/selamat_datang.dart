import 'package:flutter/material.dart';
import '../ui.dart';

class HalamanSelamatDatang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'SELAMAT DATANG DI \n APLIKASI PERAWAT',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.medical_services_outlined,
                size: 80.0,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanLogin()));
                  },
                  child: Text('Login')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanRegister()));
                },
                child: Text('Register'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
  }
}
