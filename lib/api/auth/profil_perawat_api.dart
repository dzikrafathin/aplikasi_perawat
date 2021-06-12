import '../api.dart';

class ProfilPerawatApi {
  Future<Map<String, dynamic>> getProfil() async {
    final hasil = await api.get('profil');
    if (hasil.statusCode == 201) {
      return hasil.data['data'];
    } else {
      return Map<String, dynamic>();
    }
  }
}
