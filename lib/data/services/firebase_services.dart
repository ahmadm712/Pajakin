import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pajakin/data/models/kas_model.dart';
import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/models/user_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference _mainCollection = _firestore.collection('user');
final CollectionReference _secondCollection = _firestore.collection('kas');
final CollectionReference _pemasukanCollection =
    _firestore.collection('pemasukan');
final CollectionReference _pengeluaranCollection =
    _firestore.collection('pengeluaran');

class FirebaseServices {
  static String? userUid;

  static Future<void> register({
    required String name,
    required String umkmName,
    required String email,
    required String password,
  }) async {
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          final user = UserUmkm(
            id: value.user!.uid,
            username: name,
            email: email,
            umkmname: umkmName,
            password: password,
          );

          return _mainCollection
              .doc(auth.currentUser!.uid)
              .set(user.toMap())
              .whenComplete(() => print("User Has been Created"))
              .catchError(
                (e) => print(
                  e,
                ),
              );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
    return user;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut().then(((value) {
      print("User Has been Signed Out");
    }));
  }

  static Future<List<String>?> getCurrentUserData() async {
    try {
      DocumentSnapshot ds =
          await _mainCollection.doc(auth.currentUser!.uid).get();
      String username = ds.get('username');
      String email = ds.get('email');
      String umkmName = ds.get('umkmname');
      String password = ds.get('password');

      return [username, email, umkmName, password];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> updateUser({
    required String name,
    required String umkmName,
    required String email,
    required String password,
  }) async {
    await _mainCollection
        .doc(auth.currentUser!.uid)
        .update({
          'username': name,
          'umkmname': umkmName,
          'email': email,
          'password': password,
        })
        .whenComplete(() => print('User Has been Updated'))
        .catchError((e) => print(e));
  }

  static Future<void> addPemasukan({
    required String date,
    required String id,
    required String description,
    required int jumlahPemasukan,
  }) async {
    DocumentReference documentReferencer = _pemasukanCollection
        .doc(auth.currentUser!.uid)
        .collection('list_pemasukan')
        .doc();

    Map<String, dynamic> data = <String, dynamic>{
      "uid": id,
      "tanggal_pemasukan": date,
      "keterangan": description,
      "jumlah_pemasukan": jumlahPemasukan,
    };

    _pemasukanCollection
        .add(data)
        .then((value) => print(value))
        .whenComplete(() => print('Pemasukan sukses di tambahkan'))
        .catchError((e) {
      print(e);
    });
  }

  static Future<void> addPengeluaran({
    required String date,
    required String id,
    required String description,
    required int jumlahPengeluaran,
  }) async {
    var data = <String, dynamic>{
      "uid": id,
      "tanggal_pengeluaran": date,
      "keterangan": description,
      "jumlah_pengeluaran": jumlahPengeluaran,
    };

    _pengeluaranCollection
        .add(data)
        .then((value) => print(value))
        .whenComplete(() => print('Pengeluaran sukses di tambahkan'))
        .catchError((e) {
      print(e);
    });
  }

  Future<List<PengeluaranModel>> retrievePengeluaran(
      {required String id}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("pengeluaran")
            .where(
              'uid',
              isEqualTo: id,
            )
            .get();
    return snapshot.docs
        .map(
            (docSnapshot) => PengeluaranModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<PemasukanModel>> retrievePemasukan({required String id}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("pemasukan")
            .where(
              'uid',
              isEqualTo: id,
            )
            .get();
    return snapshot.docs
        .map((docSnapshot) => PemasukanModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<int> calculateSaldo({required String id}) async {
    int totalPemasukan = 0;
    int totalPengeluaran = 0;
    int totalSaldo = 0;
    try {
      await retrievePemasukan(id: id).then((value) {
        for (var element in value) {
          totalPemasukan += element.jumlahPemasukan;
        }
      });
      await retrievePengeluaran(id: id).then((hasil) {
        for (var element in hasil) {
          totalPengeluaran += element.jumlahPengeluaran;
        }
      });
      totalSaldo = (totalPemasukan - totalPengeluaran);

      return totalSaldo;
    } catch (e) {
      print(e.toString());
      throw Exception('gagal');
    }
  }

  static Future<void> updatePengeluaran({
    required String date,
    required String idPengeluaran,
    required String description,
    required int jumlahPengeluaran,
  }) async {
    var data = <String, dynamic>{
      "tanggal_pengeluaran": date,
      "keterangan": description,
      "jumlah_pengeluaran": jumlahPengeluaran,
    };

    _pengeluaranCollection
        .doc(idPengeluaran)
        .update(data)
        .whenComplete(() => print('Pengeluaran sukses di update'))
        .catchError((e) {
      print(e);
    });
  }

  static Future<void> updatePemasukan({
    required String date,
    required String idPemasukan,
    required String description,
    required int jumlahPemasukan,
  }) async {
    var data = <String, dynamic>{
      "tanggal_pemasukan": date,
      "keterangan": description,
      "jumlah_pemasukan": jumlahPemasukan,
    };

    _pemasukanCollection
        .doc(idPemasukan)
        .update(data)
        .whenComplete(() => print('Pengeluaran sukses di update'))
        .catchError((e) {
      print(e);
    });
  }

  static Future<UserUmkm> fetchUSer({required String uid}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("user")
            .where(
              'id',
              isEqualTo: uid,
            )
            .get();

    return snapshot.docs.map((e) => UserUmkm.fromMap(e)).first;
  }

  // static Stream<List<PengeluaranModel>> readListPengeluaran() {
  //   return FirebaseFirestore.instance
  //       .collection('pengeluaran')
  //       .where('id', isEqualTo: auth.currentUser!.uid)
  //       .snapshots()
  //       .map((snapshot) => PengeluaranModel.fromMap(snapshot.docs.first.data()))
  //       .toList();
  // }

  // static Future<void> deleteItem({
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(userUid).collection('items').doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }
}
