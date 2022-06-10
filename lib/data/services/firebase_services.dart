import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pajakin/data/models/kas_model.dart';
import 'package:pajakin/data/models/user_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
final CollectionReference _mainCollection = _firestore.collection('user');
final CollectionReference _secondCollection = _firestore.collection('kas');

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
            uid: value.user!.uid,
            saldo: 0,
            pemasukan: 0,
            pengeluaran: 0,
          );
          final user = UserUmkm(
            id: value.user!.uid,
            username: name,
            email: email,
            umkmname: umkmName,
            password: password,
            saldo: 0,
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

  static Future<void> updateInformationAccount({
    required String name,
    required String umkmName,
    required String email,
    required String password,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(userUid);

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
  // static Future<void> updateItem({
  //   required DateTime time,
  //   required String name,
  //   required bool isPinLocation,
  // }) async {
  //   DocumentReference documentReferencer = _mainCollection.doc(userUid);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "time": time,
  //     "name": name,
  //     "is_pin_Location": isPinLocation,
  //   };

  //   await documentReferencer
  //       .update(data)
  //       .whenComplete(() => print("Note item updated in the database"))
  //       .catchError((e) => print(e));
  // }

  // static Stream<List<Attendance>> readItems() {
  //   return FirebaseFirestore.instance
  //       .collection('attendance')
  //       .orderBy('time')
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((e) => Attendance.fromJson(e.data())).toList());
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
