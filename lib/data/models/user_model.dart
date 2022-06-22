import 'dart:convert';

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

  factory UserUmkm.fromMap(Map<String, dynamic> map) {
    return UserUmkm(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      umkmname: map['umkmname'] ?? '',
      password: map['password'] ?? '',
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
