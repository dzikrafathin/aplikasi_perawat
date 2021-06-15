import 'package:flutter/material.dart';
import 'package:aplikasi_perawat/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikasi_perawat/api/api.dart';

class HalamanUbahPasien extends StatelessWidget {
  final int idPasien;

  HalamanUbahPasien({Key? key, required this.idPasien}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah data pasien'),
      ),
      body: BlocProvider(
        create: (context) =>
            UbahPasienBloc(idPasien: idPasien, pasienApi: PasienApi())
              ..add(MuatPasienEvent()),
        child: BlocConsumer<UbahPasienBloc, UbahPasienState>(
          builder: (context, state) {
            //_FormUbahPasien()
            switch (state.status) {
              case UbahPasienStatus.gagalMemuat:
                return Center(
                  child: Text('Gagal memuat data Pasien!'),
                );
              case UbahPasienStatus.memuat:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return _FormUbahPasien();
            }
          },
          listener: (context, state) {
            switch (state.status) {
              case UbahPasienStatus.berhasilMengirim:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Perubahan data pasien telah disimpan')));
                Navigator.pop(context);
                break;
              case UbahPasienStatus.gagalMengirim:
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

class _FormUbahPasien extends StatelessWidget {
  const _FormUbahPasien({
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          if (state.status == UbahPasienStatus.mengirim) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<UbahPasienBloc>(context)
                      .add(KirimPerubahanPasienEvent());
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            initialValue: state.pasien.alamat,
            maxLines: 5,
            onChanged: (alamat) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(AlamatPasienUbahBerubahEvent(alamat));
            },
            decoration: InputDecoration(
                errorText: state.pasienError.alamat != ''
                    ? state.pasienError.alamat
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            initialValue: state.pasien.tempatLahir,
            onChanged: (tempatLahir) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(TempatLahirPasienUbahBerubahEvent(tempatLahir));
            },
            decoration: InputDecoration(
                errorText: state.pasienError.tempatLahir != ''
                    ? state.pasienError.tempatLahir
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            initialValue: state.pasien.tanggalLahir,
            onChanged: (tglLahir) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(TglLahirPasienUbahBerubahEvent(tglLahir));
            },
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                errorText: state.pasienError.tanggalLahir != ''
                    ? state.pasienError.tanggalLahir
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            initialValue: state.pasien.noHp,
            onChanged: (noHp) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(NoHpPasienUbahBerubahEvent(noHp));
            },
            decoration: InputDecoration(
                errorText: state.pasienError.noHp != ''
                    ? state.pasienError.noHp
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            initialValue: state.pasien.email,
            onChanged: (email) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(EmailPasienUbahBerubahEvent(email));
            },
            decoration: InputDecoration(
                errorText: state.pasienError.email != ''
                    ? state.pasienError.email
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (nama) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(NamaPasienUbahBerubahEvent(nama));
            },
            initialValue: state.pasien.nama,
            decoration: InputDecoration(
                errorText: state.pasienError.nama != ''
                    ? state.pasienError.nama
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return TextFormField(
            onChanged: (noRm) {
              BlocProvider.of<UbahPasienBloc>(context)
                  .add(NoRmPasienUbahBerubahEvent(noRm));
            },
            initialValue: state.pasien.noRm,
            decoration: InputDecoration(
                errorText: state.pasienError.noRm != ''
                    ? state.pasienError.noRm
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
    return BlocBuilder<UbahPasienBloc, UbahPasienState>(
        bloc: BlocProvider.of<UbahPasienBloc>(context),
        builder: (context, state) {
          return DropdownButtonFormField<int>(
              value: state.pasien.jenisKelamin,
              onChanged: (jenisKelamin) {
                BlocProvider.of<UbahPasienBloc>(context)
                    .add(JenisKelaminPasienUbahBerubahEvent(jenisKelamin ?? 0));
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
