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
}
