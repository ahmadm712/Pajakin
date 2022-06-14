import 'dart:convert';

class KasModel {
  String id;
  int saldo;
  int pemasukan;
  int pengeluaran;

  KasModel({
    required this.id,
    required this.saldo,
    required this.pemasukan,
    required this.pengeluaran,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'saldo': saldo,
      'pemasukan': pemasukan,
      'pengeluaran': pengeluaran,
    };
  }

  factory KasModel.fromMap(Map<String, dynamic> map) {
    return KasModel(
      id: map['id'] ?? '',
      saldo: map['saldo']?.toInt() ?? 0,
      pemasukan: map['pemasukan']?.toInt() ?? 0,
      pengeluaran: map['pengeluaran']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory KasModel.fromJson(String source) =>
      KasModel.fromMap(json.decode(source));
}
