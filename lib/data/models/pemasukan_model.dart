import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PemasukanModel {
  String id;
  String tanggalPemasukan;
  String keterangan;
  int jumlahPemasukan;

  PemasukanModel({
    required this.id,
    required this.tanggalPemasukan,
    required this.keterangan,
    required this.jumlahPemasukan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggalPemasukan': tanggalPemasukan,
      'keterangan': keterangan,
      'jumlahPemasukan': jumlahPemasukan,
    };
  }

  factory PemasukanModel.fromMap(Map<String, dynamic> map) {
    return PemasukanModel(
      id: map['id'] ?? '',
      tanggalPemasukan: map['tanggalPemasukan'] ?? '',
      keterangan: map['keterangan'] ?? '',
      jumlahPemasukan: map['jumlahPemasukan']?.toInt() ?? 0,
    );
  }

  factory PemasukanModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return PemasukanModel(
        id: doc.id,
        tanggalPemasukan: doc.data()!['tanggal_pemasukan'],
        keterangan: doc.data()!['keterangan'],
        jumlahPemasukan: doc.data()!['jumlah_pemasukan']);
  }

  String toJson() => json.encode(toMap());

  factory PemasukanModel.fromJson(String source) =>
      PemasukanModel.fromMap(json.decode(source));
}
