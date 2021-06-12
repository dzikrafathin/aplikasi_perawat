import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigasi_event.dart';
part 'navigasi_state.dart';

class NavigasiBloc extends Bloc<NavigasiEvent, NavigasiState> {
  NavigasiBloc() : super(NavigasiState(PosisiHalaman.dashboard));

  @override
  Stream<NavigasiState> mapEventToState(NavigasiEvent event) async* {
    if (event is PindahHalamanEvent) {
      yield _mapPindahHalamanEventToState(event, state);
    }
  }

  NavigasiState _mapPindahHalamanEventToState(
      PindahHalamanEvent event, NavigasiState state) {
    return NavigasiState(event.tujuan);
  }
}
