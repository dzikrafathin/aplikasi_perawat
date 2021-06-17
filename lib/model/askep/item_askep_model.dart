import 'package:equatable/equatable.dart';

import '../model.dart';

class ItemAskepModel extends Equatable {
  final int idAskep;
  final ItemPasienModel pasien;
  const ItemAskepModel({required this.idAskep, required this.pasien});

  factory ItemAskepModel.fromJson(Map<String, dynamic> json) {
    return ItemAskepModel(
        idAskep: json['id_asuhan_keperawatan'],
        pasien: ItemPasienModel.fromJson(json['pasien']));
  }

  List<Object> get props => [idAskep, pasien];
}
