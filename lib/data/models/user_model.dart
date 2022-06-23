import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserUmkm {
  String id;
  String username;
  String email;
  String umkmname;
  String password;
  UserUmkm({
    required this.id,
    required this.username,
    required this.email,
    required this.umkmname,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'umkmname': umkmname,
      'password': password,
    };
  }

  factory UserUmkm.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserUmkm(
      id: doc.id,
      username: doc.data()!['username'],
      email: doc.data()!['email'] ?? '',
      umkmname: doc.data()!['umkmname'],
      password: doc.data()!['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserUmkm.fromJson(String source) =>
      UserUmkm.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, umkmname: $umkmname, password: $password)';
  }
}
