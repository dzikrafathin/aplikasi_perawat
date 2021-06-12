import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'ui/ui.dart';
import 'api/api.dart';

void main() {
  runApp(AppPerawat());
}

class AppPerawat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return _RepoProvider();
    return _BlocProvider();
  }
}

class _RepoProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [], child: _BlocProvider());
  }
}

class _BlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(authApi: AuthApi())),
      BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(authApi: AuthApi())),
      BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(loginBloc: BlocProvider.of<LoginBloc>(context))
                ..add(InisialisasiAwalEvent())),
      BlocProvider<NavigasiBloc>(create: (context) => NavigasiBloc())
    ], child: _AuthLogic());
  }
}

class _AuthLogic extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      onGenerateRoute: (_) =>
          MaterialPageRoute(builder: (_) => HalamanSplash()),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SudahLoginState) {
                _navigator.pushAndRemoveUntil<void>(
                    MaterialPageRoute(builder: (context) => HalamanNavigasi()),
                    (route) => false);
              } else if (state is BelumLoginState) {
                _navigator.pushAndRemoveUntil<void>(
                    MaterialPageRoute(
                        builder: (context) => HalamanSelamatDatang()),
                    (route) => false);
              }
            },
            child: child);
      },
    );
  }
}
