import 'dart:convert';

import '../api.dart';
import '../../model/model.dart';

class PasienApi {
  Future<List<ItemPasienModel>> daftarPasien({String? noRm}) async {
    final hasil = await api.get('pasien', queryParameters: {"no_rm": noRm});
    if (hasil.statusCode == 201) {
      List<dynamic> daftarJson = hasil.data['data'];
      List<ItemPasienModel> daftar =
          daftarJson.map((e) => ItemPasienModel.fromJson(e)).toList();
      return daftar;
    } else {
      return [];
    }
  }

  Future<PasienModel> storePasien(PasienModel pasienModel) async {
    final hasil = await api.post('pasien', data: jsonEncode(pasienModel));
    if (hasil.statusCode == 201) {
      PasienModel pasienHasil = PasienModel.fromJson(hasil.data['data']);
      return pasienHasil;
    } else {
      return PasienModel();
    }
  }

  Future<bool> destroyPasien(int idPasien) async {
    final hasil = await api.delete('pasien/$idPasien');
    if (hasil.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
