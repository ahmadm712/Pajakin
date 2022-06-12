import 'dart:convert';

class PengeluaranModel {
  String id;
  String tanggalPemasukan;
  String keterangan;
  int jumlahPemasukan;

  PengeluaranModel({
    required this.id,
    required this.tanggalPemasukan,
    required this.keterangan,
    required this.jumlahPemasukan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal_pengeluaran': tanggalPemasukan,
      'keterangan': keterangan,
      'jumlahPemasukan': jumlahPemasukan,
    };
  }

  factory PengeluaranModel.fromMap(Map<String, dynamic> map) {
    return PengeluaranModel(
      id: map['id'] ?? '',
      tanggalPemasukan: map['tanggalPemasukan'] ?? '',
      keterangan: map['keterangan'] ?? '',
      jumlahPemasukan: map['jumlahPemasukan']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PengeluaranModel.fromJson(String source) =>
      PengeluaranModel.fromMap(json.decode(source));
}
