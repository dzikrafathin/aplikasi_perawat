import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../ui.dart';

class HalamanRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: BlocListener<RegisterBloc, RegisterState>(
        bloc: BlocProvider.of<RegisterBloc>(context),
        listener: (context, state) {
          if (state.status == RegisterStatus.gagal) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Terjadi kesalahan saat proses Register')));
          } else if (state.status == RegisterStatus.berhasil) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                      'Proses registrasi berhasil silakan login dengan akun yang sudah dibuat')));
            Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute(builder: (context) => HalamanLogin()),
                (route) => false);
          }
        },
        child: _FormRegister(),
      ),
    ));
  }
}

class _FormRegister extends StatelessWidget {
  const _FormRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Register Akun Perawat Baru',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20),
        _InputNama(),
        _InputEmail(),
        _InputPassword(),
        SizedBox(
          height: 20,
        ),
        _TombolRegister()
      ],
    );
  }
}

class _TombolRegister extends StatelessWidget {
  const _TombolRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
        bloc: BlocProvider.of<RegisterBloc>(context),
        builder: (context, state) {
          if (state.status == RegisterStatus.proses) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RegisterBloc>(context)
                      .add(RegisterKirimEvent());
                },
                child: Text('Register'));
          }
        });
  }
}

class _InputNama extends StatelessWidget {
  const _InputNama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        onChanged: (nama) {
          BlocProvider.of<RegisterBloc>(context)
              .add(RegisterNamaBerubahEvent(nama));
        },
        decoration: InputDecoration(
            labelText: 'Nama Lengkap',
            errorText: state.registerErrorModel.nama != ''
                ? state.registerErrorModel.nama
                : null),
      );
    });
  }
}

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        onChanged: (email) {
          BlocProvider.of<RegisterBloc>(context)
              .add(RegisterEmailBerubahEvent(email));
        },
        decoration: InputDecoration(
            labelText: 'Alamat E-Mail',
            errorText: state.registerErrorModel.email != ''
                ? state.registerErrorModel.email
                : null),
      );
    });
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        onChanged: (password) {
          BlocProvider.of<RegisterBloc>(context)
              .add(RegisterPasswordBerubahEvent(password));
        },
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password',
            errorText: state.registerErrorModel.password != ''
                ? state.registerErrorModel.password
                : null),
      );
    });
  }
}
