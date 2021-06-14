import 'package:flutter/material.dart';

class HalamanTambahPasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftarkan Pasien Baru'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        children: [
          _InputNomorRM(),
          _InputNamaLengkap(),
          _InputJenisKelamin(),
          _InputAlamatEmail(),
          _InputNomorHP(),
          _InputTanggalLahir(),
          _InputTempatLahir(),
          _InputAlamat(),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Simpan Data Pasien'))
        ],
      ),
    );
  }
}

class _InputAlamat extends StatelessWidget {
  const _InputAlamat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      decoration:
          InputDecoration(labelText: 'Alamat', icon: Icon(Icons.location_on)),
    );
  }
}

class _InputTempatLahir extends StatelessWidget {
  const _InputTempatLahir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Tempat Lahir', icon: Icon(Icons.location_history)),
    );
  }
}

class _InputTanggalLahir extends StatelessWidget {
  const _InputTanggalLahir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'TTTT/BB/HH',
          labelText: 'Tanggal Lahir',
          icon: Icon(Icons.calendar_today)),
    );
  }
}

class _InputNomorHP extends StatelessWidget {
  const _InputNomorHP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nomor HP', icon: Icon(Icons.phone_android)),
    );
  }
}

class _InputAlamatEmail extends StatelessWidget {
  const _InputAlamatEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Alamat E-Mail', icon: Icon(Icons.mail)),
    );
  }
}

class _InputNamaLengkap extends StatelessWidget {
  const _InputNamaLengkap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Nama Lengkap', icon: Icon(Icons.person)),
    );
  }
}

class _InputNomorRM extends StatelessWidget {
  const _InputNomorRM({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nomor RM', icon: Icon(Icons.confirmation_number)),
    );
  }
}

class _InputJenisKelamin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
        value: 1,
        decoration: InputDecoration(
            labelText: 'Jenis Kelamin', icon: Icon(Icons.person)),
        items: [
          DropdownMenuItem<int>(
            child: Text('Laki-Laki'),
            value: 1,
          ),
          DropdownMenuItem<int>(
            child: Text('Perempuan'),
            value: 0,
          )
        ]);
  }
}
