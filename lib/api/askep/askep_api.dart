import 'package:aplikasi_perawat/model/model.dart';
import '../api.dart';

class AskepApi {
  Future<List<ItemAskepModel>> daftarAskep() async {
    final hasil = await api.get('asuhan-keperawatan');
    if (hasil.statusCode == 201) {
      List<dynamic> data = hasil.data['data'];
      List<ItemAskepModel> daftar =
          data.map((e) => ItemAskepModel.fromJson(e)).toList();
      return daftar;
    } else {
      return [];
    }
  }
}
