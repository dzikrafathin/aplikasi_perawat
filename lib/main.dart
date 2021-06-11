import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'ui/ui.dart';

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
      BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(TidakDiketahuiState())..add(InisialisasiAwalEvent()))
    ], child: _MainApp());
  }
}

class _MainApp extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => HalamanDashboard()),
                    (route) => false);
              } else if (state is BelumLoginState) {
                print('OKE');
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
