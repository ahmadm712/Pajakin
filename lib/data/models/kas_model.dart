import 'dart:convert';

class KasModel {
  String uid;
  int saldo;
  int pemasukan;
  int pengeluaran;

  KasModel({
    required this.uid,
    required this.saldo,
    required this.pemasukan,
    required this.pengeluaran,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'saldo': saldo,
      'pemasukan': pemasukan,
      'pengeluaran': pengeluaran,
    };
  }

  factory KasModel.fromMap(Map<String, dynamic> map) {
    return KasModel(
      uid: map['uid'] ?? '',
      saldo: map['saldo']?.toInt() ?? 0,
      pemasukan: map['pemasukan']?.toInt() ?? 0,
      pengeluaran: map['pengeluaran']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory KasModel.fromJson(String source) =>
      KasModel.fromMap(json.decode(source));
}
