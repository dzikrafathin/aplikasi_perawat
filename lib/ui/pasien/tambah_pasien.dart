import 'package:flutter/material.dart';
import 'package:aplikasi_perawat/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

class HalamanTambahPasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftarkan Pasien Baru'),
      ),
      body: BlocProvider(
        create: (context) => TambahPasienBloc(pasienApi: PasienApi()),
        child: BlocListener<TambahPasienBloc, TambahPasienState>(
          child: _FormTambahPasien(),
          listener: (context, state) {
            switch (state.status) {
              case TambahPasienStatus.berhasil:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Pasien baru berhasil ditambahkan')));
                Navigator.pop(context);
                break;
              case TambahPasienStatus.gagal:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'Terjadi kesalahan saat proses mengirim data pasien ke server!')));
                break;
              default:
                break;
            }
          },
        ),
      ),
    );
  }
}

class _FormTambahPasien extends StatelessWidget {
  const _FormTambahPasien({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        _TombolKirim()
      ],
    );
  }
}

class _TombolKirim extends StatelessWidget {
  const _TombolKirim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          if (state.status == TambahPasienStatus.mengirim) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TambahPasienBloc>(context)
                      .add(KirimPasienBaruEvent());
                },
                child: Text('Simpan Data Pasien'));
          }
        });
  }
}

class _InputAlamat extends StatelessWidget {
  const _InputAlamat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            maxLines: 5,
            onChanged: (alamat) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(AlamatPasienBerubahEvent(alamat));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.alamat != ''
                    ? state.pasienBaruError.alamat
                    : null,
                labelText: 'Alamat',
                icon: Icon(Icons.location_on)),
          );
        });
  }
}

class _InputTempatLahir extends StatelessWidget {
  const _InputTempatLahir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (tempatLahir) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(TempatLahirPasienBerubahEvent(tempatLahir));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.tempatLahir != ''
                    ? state.pasienBaruError.tempatLahir
                    : null,
                labelText: 'Tempat Lahir',
                icon: Icon(Icons.location_history)),
          );
        });
  }
}

class _InputTanggalLahir extends StatelessWidget {
  const _InputTanggalLahir({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (tglLahir) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(TglLahirPasienBerubahEvent(tglLahir));
            },
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                errorText: state.pasienBaruError.tanggalLahir != ''
                    ? state.pasienBaruError.tanggalLahir
                    : null,
                hintText: 'TTTT/BB/HH',
                labelText: 'Tanggal Lahir',
                icon: Icon(Icons.calendar_today)),
          );
        });
  }
}

class _InputNomorHP extends StatelessWidget {
  const _InputNomorHP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (noHp) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(NoHpPasienBerubahEvent(noHp));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.noHp != ''
                    ? state.pasienBaruError.noHp
                    : null,
                labelText: 'Nomor HP',
                icon: Icon(Icons.phone_android)),
          );
        });
  }
}

class _InputAlamatEmail extends StatelessWidget {
  const _InputAlamatEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (email) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(EmailPasienBerubahEvent(email));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.email != ''
                    ? state.pasienBaruError.email
                    : null,
                labelText: 'Alamat E-Mail',
                icon: Icon(Icons.mail)),
          );
        });
  }
}

class _InputNamaLengkap extends StatelessWidget {
  const _InputNamaLengkap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (nama) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(NamaPasienBerubahEvent(nama));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.nama != ''
                    ? state.pasienBaruError.nama
                    : null,
                labelText: 'Nama Lengkap',
                icon: Icon(Icons.person)),
          );
        });
    // return TextFormField(
    //   decoration:
    //       InputDecoration(labelText: 'Nama Lengkap', icon: Icon(Icons.person)),
    // );
  }
}

class _InputNomorRM extends StatelessWidget {
  const _InputNomorRM({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (noRm) {
              BlocProvider.of<TambahPasienBloc>(context)
                  .add(NoRmPasienBerubahEvent(noRm));
            },
            decoration: InputDecoration(
                errorText: state.pasienBaruError.noRm != ''
                    ? state.pasienBaruError.noRm
                    : null,
                labelText: 'Nomor RM',
                icon: Icon(Icons.confirmation_number)),
          );
        });
  }
}

class _InputJenisKelamin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TambahPasienBloc, TambahPasienState>(
        bloc: BlocProvider.of<TambahPasienBloc>(context),
        builder: (context, state) {
          return DropdownButtonFormField<int>(
              value: state.pasienBaru.jenisKelamin,
              onChanged: (jenisKelamin) {
                BlocProvider.of<TambahPasienBloc>(context)
                    .add(JenisKelaminPasienBerubahEvent(jenisKelamin ?? 0));
              },
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
        });
  }
}
