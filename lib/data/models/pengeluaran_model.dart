import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PengeluaranModel {
  String id;
  String tanggalPemasukan;
  String keterangan;
  int jumlahPengeluaran;

  PengeluaranModel({
    required this.id,
    required this.tanggalPemasukan,
    required this.keterangan,
    required this.jumlahPengeluaran,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal_pengeluaran': tanggalPemasukan,
      'keterangan': keterangan,
      'jumlahPengeluaran': jumlahPengeluaran,
    };
  }

  factory PengeluaranModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return PengeluaranModel(
      id: doc.id,
      tanggalPemasukan: doc.data()!['tanggal_pengeluaran'],
      keterangan: doc.data()!['keterangan'],
      jumlahPengeluaran: doc.data()!['jumlah_pengeluaran'],
    );
  }

  factory PengeluaranModel.fromMap(Map<String, dynamic> map) {
    return PengeluaranModel(
      id: map['id'] ?? '',
      tanggalPemasukan: map['tanggalPemasukan'] ?? '',
      keterangan: map['keterangan'] ?? '',
      jumlahPengeluaran: map['jumlahPengeluaran']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PengeluaranModel.fromJson(String source) => PengeluaranModel.fromMap(
        json.decode(source),
      );
}
