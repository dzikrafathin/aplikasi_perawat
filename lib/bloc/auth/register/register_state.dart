part of 'register_bloc.dart';

enum RegisterStatus { mengisi, proses, berhasil, gagal }

class RegisterState extends Equatable {
  final RegisterModel registerModel;
  final RegisterStatus status;
  final RegisterErrorModel registerErrorModel;

  RegisterState copyWith(
      {RegisterModel? registerModel,
      RegisterStatus? status,
      RegisterErrorModel? registerErrorModel,
      String? token}) {
    return RegisterState(
        registerModel: registerModel ?? this.registerModel,
        status: status ?? this.status,
        registerErrorModel: registerErrorModel ?? this.registerErrorModel);
  }

  const RegisterState(
      {this.status = RegisterStatus.mengisi,
      this.registerModel = const RegisterModel(),
      this.registerErrorModel = const RegisterErrorModel()});
  List<Object> get props => [registerModel, status, registerErrorModel];
}
