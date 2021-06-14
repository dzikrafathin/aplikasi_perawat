import 'package:equatable/equatable.dart';

class ItemPasienModel extends Equatable {
  final int id;
  final String noRm;
  final String nama;
  final bool jenisKelamin;

  const ItemPasienModel(
      {this.id = 0, this.noRm = '', this.nama = '', this.jenisKelamin = false});

  factory ItemPasienModel.fromJson(Map<String, dynamic> json) {
    return ItemPasienModel(
        id: json['id_pasien'],
        noRm: json['no_rm'],
        nama: json['nama'],
        jenisKelamin: json['jenis_kelamin'] == 1);
  }

  List<Object> get props => [id, noRm, nama, jenisKelamin];
}
