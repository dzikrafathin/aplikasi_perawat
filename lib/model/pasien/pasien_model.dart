import 'package:equatable/equatable.dart';

class PasienModel extends Equatable {
  final int id;
  final String noRm;
  final String nama;
  final String email;
  final int jenisKelamin;
  final String noHp;
  final String tempatLahir;
  final String tanggalLahir;
  final String alamat;

  const PasienModel(
      {this.id = 0,
      this.noRm = '',
      this.nama = '',
      this.email = '',
      this.jenisKelamin = 0,
      this.noHp = '',
      this.tempatLahir = '',
      this.tanggalLahir = '',
      this.alamat = ''});

  factory PasienModel.fromJson(Map<String, dynamic> json) {
    return PasienModel(
        id: json['id_pasien'],
        nama: json['nama'],
        email: json['email'],
        jenisKelamin: json['jenis_kelamin'],
        noRm: json['no_rm'],
        noHp: json['no_hp'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'],
        alamat: json['alamat']);
  }

  Map<String, dynamic> toJson() => {
        "id_pasien": this.id,
        "no_rm": this.noRm,
        "nama": this.nama,
        "jenis_kelamin": this.jenisKelamin,
        "email": this.email,
        "no_hp": this.noHp,
        "tempat_lahir": this.tempatLahir,
        "tanggal_lahir": this.tanggalLahir,
        "alamat": this.alamat
      };

  PasienModel copyWith({
    int? id,
    String? noRm,
    String? nama,
    String? email,
    int? jenisKelamin,
    String? noHp,
    String? tempatLahir,
    String? tanggalLahir,
    String? alamat,
  }) {
    return PasienModel(
        id: id ?? this.id,
        noRm: noRm ?? this.noRm,
        nama: nama ?? this.nama,
        email: email ?? this.email,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        noHp: noHp ?? this.noHp,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        alamat: alamat ?? this.alamat);
  }

  List<Object> get props => [
        id,
        noRm,
        nama,
        email,
        jenisKelamin,
        noHp,
        tempatLahir,
        tanggalLahir,
        alamat
      ];
}

class PasienErrorModel extends Equatable {
  final String noRm;
  final String nama;
  final String email;
  final String jenisKelamin;
  final String noHp;
  final String tempatLahir;
  final String tanggalLahir;
  final String alamat;

  const PasienErrorModel(
      {this.noRm = '',
      this.nama = '',
      this.email = '',
      this.jenisKelamin = '',
      this.noHp = '',
      this.tempatLahir = '',
      this.tanggalLahir = '',
      this.alamat = ''});

  factory PasienErrorModel.fromJson(Map<String, dynamic> json) {
    return PasienErrorModel(
        nama: json['nama'] != null ? json['nama'].join() : '',
        email: json['email'] != null ? json['email'].join() : '',
        jenisKelamin:
            json['jenis_kelamin'] != null ? json['jenis_kelamin'].join() : '',
        noRm: json['no_rm'] != null ? json['no_rm'].join() : '',
        noHp: json['no_hp'] != null ? json['no_hp'].join() : '',
        tempatLahir:
            json['tempat_lahir'] != null ? json['tempat_lahir'].join() : '',
        tanggalLahir:
            json['tanggal_lahir'] != null ? json['tanggal_lahir'].join() : '',
        alamat: json['alamat'] != null ? json['alamat'].join() : '');
  }

  PasienErrorModel copyWith({
    String? noRm,
    String? nama,
    String? email,
    String? jenisKelamin,
    String? noHp,
    String? tempatLahir,
    String? tanggalLahir,
    String? alamat,
  }) {
    return PasienErrorModel(
        noRm: noRm ?? this.noRm,
        nama: nama ?? this.nama,
        email: email ?? this.email,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        noHp: noHp ?? this.noHp,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        alamat: alamat ?? this.alamat);
  }

  List<Object> get props => [
        noRm,
        nama,
        email,
        jenisKelamin,
        noHp,
        tempatLahir,
        tanggalLahir,
        alamat
      ];
}
