import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';

class HalamanLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: BlocListener<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (context, state) {
          if (state.status == LoginStatus.gagal) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Terjadi kesalahan saat proses Login')));
          }
        },
        child: _FormLogin(),
      ),
    ));
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login Akun Perawat',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 20),
        _InputEmail(),
        _InputPassword(),
        SizedBox(
          height: 20,
        ),
        _TombolLogin()
      ],
    );
  }
}

class _TombolLogin extends StatelessWidget {
  const _TombolLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, state) {
          if (state.status == LoginStatus.proses) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginKirimEvent());
                },
                child: Text('Login'));
          }
        });
  }
}

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        onChanged: (email) {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginEmailBerubahEvent(email));
        },
        decoration: InputDecoration(
            labelText: 'Alamat E-Mail',
            errorText: state.loginErrorModel.email != ''
                ? state.loginErrorModel.email
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
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        onChanged: (password) {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginPasswordBerubahEvent(password));
        },
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password',
            errorText: state.loginErrorModel.password != ''
                ? state.loginErrorModel.password
                : null),
      );
    });
  }
}
