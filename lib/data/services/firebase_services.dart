import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/models/user_model.dart';
import 'package:pajakin/utils/routes.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference mainCollection = _firestore.collection('user');
final CollectionReference _pemasukanCollection =
    _firestore.collection('pemasukan');
final CollectionReference _pengeluaranCollection =
    _firestore.collection('pengeluaran');
GoogleSignIn googleSignIn = GoogleSignIn();

class FirebaseServices {
  static String? userUid;

  Future<UserCredential> signInWithGoogleNew() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> searchUser({required String id}) async {
    final DocumentSnapshot doc = await mainCollection.doc(id).get();

    return doc.exists ? true : false;
  }

  Future signOut({required BuildContext context}) async {
    await auth.signOut().whenComplete(() async {
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn
            .signOut()
            .whenComplete(() => Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.LOGIN_PAGE,
                  (route) => false,
                ));
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.LOGIN_PAGE,
          (route) => false,
        );
      }
    });
  }

  static Future<UserCredential> register({
    required String name,
    required String umkmName,
    required String email,
    required String password,
  }) async {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> registergoogleSignIn({required User user}) async {
    try {
      final userUmkm = UserUmkm(
        id: user.uid,
        username: user.displayName!,
        email: user.email!,
        umkmname: '',
        password: user.uid,
      );

      return mainCollection
          .doc(auth.currentUser!.uid)
          .set(userUmkm.toMap())
          .whenComplete(() => print("User Has been Created"))
          .catchError(
            (e) => print(
              e,
            ),
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

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    return user;
  }

  static Future<void> updateInformationAccount({
    required String name,
    required String umkmName,
    required String email,
    required String password,
  }) async {
    DocumentReference documentReferencer = mainCollection.doc(userUid);

    Map<String, dynamic> data = <String, dynamic>{
      "userName": name,
      "umkmName": umkmName,
      "email": email,
      "password": password,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Information item updated in the database"))
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
    final data = snapshot.docs
        .map(
            (docSnapshot) => PengeluaranModel.fromDocumentSnapshot(docSnapshot))
        .toList();

    streamPengeluaran.sink.add(data);
    return data;
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

    final data = snapshot.docs
        .map((docSnapshot) => PemasukanModel.fromDocumentSnapshot(docSnapshot))
        .toList();
    streamPemasukan.sink.add(data);

    return data;
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
      streamSaldo.sink.add(totalSaldo);
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

  // static Future<void> deleteItem({
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       mainCollection.doc(userUid).collection('items').doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }

  StreamController<List<PengeluaranModel>> streamPengeluaran =
      StreamController();

  StreamController<List<PemasukanModel>> streamPemasukan = StreamController();
  StreamController<int> streamSaldo = StreamController();
}
