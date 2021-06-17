import 'package:equatable/equatable.dart';
import 'package:aplikasi_perawat/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../askep.dart';

export 'pasien_baru/pasien_baru_bloc.dart';

part 'buat_askep_event.dart';
part 'buat_askep_state.dart';

class BuatAskepBloc extends Bloc<BuatAskepEvent, BuatAskepState> {
  final PasienBaruBloc pasienBaruBloc;
  BuatAskepBloc({required this.pasienBaruBloc})
      : super(BuatAskepTidakDiketahuiState()) {
    pasienBaruBloc.stream.listen((state) {
      if (state.status == PasienBaruStatus.berhasil) {
        add(PasienDipilihEvent(state.pasienBaru));
      }
    });
  }

  @override
  Stream<BuatAskepState> mapEventToState(BuatAskepEvent event) async* {
    if (event is MulaiBuatPasienBaruEvent) {
      yield BuatPasienBaruState();
    } else if (event is MulaiPilihPasienLamaEvent) {
      yield PilihPasienLamaState();
    } else if (event is PasienDipilihEvent) {
      yield PasienDipilihState(event.pasien);
    }
  }
}
