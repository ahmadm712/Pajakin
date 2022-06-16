import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pajakin/data/models/kas_model.dart';
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
          final kas = KasModel(
            id: value.user!.uid,
            saldo: 0,
            pemasukan: 0,
            pengeluaran: 0,
          );
          _secondCollection
              .doc(auth.currentUser!.uid)
              .set(kas.toMap())
              .whenComplete(() => print('Kas has Created'))
              .catchError((e) => print(e));

          final user = UserUmkm(
            id: value.user!.uid,
            username: name,
            email: email,
            umkmname: umkmName,
            password: password,
            kasId: value.user!.uid,
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

  static Future getCurrentUserData() async {
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
    required String description,
    required int jumlahPemasukan,
  }) async {
    DocumentReference documentReferencer = _pemasukanCollection
        .doc(auth.currentUser!.uid)
        .collection('list_pemasukan')
        .doc();

    Map<String, dynamic> data = <String, dynamic>{
      "tanggal_pemasukan": date,
      "keterangan": description,
      "jumlah_pemasukan": jumlahPemasukan,
    };

    await documentReferencer.set(data).whenComplete(() async {
      print("Pemasukan  added to the database");

      readItemsKas(kasId: auth.currentUser!.uid).first.then((value) async {
        await _secondCollection
            .doc(auth.currentUser!.uid)
            .update({
              'pemasukan': (value.pemasukan + data['jumlah_pemasukan']),
              'saldo': (value.saldo + data['jumlah_pemasukan']),
            })
            .whenComplete(() => print('update succes'))
            .catchError((e) => print(e));
      });
    }).catchError((e) => print(e));
  }

  static Future<void> addPengeluaran({
    required String date,
    required String description,
    required int jumlahPengeluaran,
  }) async {
    DocumentReference documentReferencer = _pengeluaranCollection
        .doc(auth.currentUser!.uid)
        .collection('list_pengeluaran')
        .doc();

    var data = <String, dynamic>{
      "tanggal_pengeluaran": date,
      "keterangan": description,
      "jumlah_pengeluaran": jumlahPengeluaran,
    };

    await documentReferencer.set(data).whenComplete(() async {
      print("Pengeluaran  added to the database");

      readItemsKas(kasId: auth.currentUser!.uid).first.then((value) async {
        await _secondCollection
            .doc(auth.currentUser!.uid)
            .update({
              'pengeluaran': (value.pengeluaran + data['jumlah_pengeluaran']),
              'saldo': (value.saldo - data['jumlah_pengeluaran']),
            })
            .whenComplete(() => print('update succes'))
            .catchError((e) => print(e));
      });
    }).catchError((e) => print(e));
  }

  static Stream<KasModel> readItemsKas({required String kasId}) {
    return FirebaseFirestore.instance
        .collection('kas')
        .where('id', isEqualTo: kasId)
        .snapshots()
        .map((snapshot) => KasModel.fromMap(snapshot.docs.first.data()));
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
