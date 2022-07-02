import 'dart:async';

import 'package:pajakin/data/models/user_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/styles.dart';

class InformationAccountPage extends StatefulWidget {
  const InformationAccountPage({Key? key}) : super(key: key);

  @override
  State<InformationAccountPage> createState() => _InformationAccountPageState();
}

class _InformationAccountPageState extends State<InformationAccountPage> {
  FirebaseServices firebaseServices = FirebaseServices();

  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _umkmNameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  bool isObscure = true;

  _updateDialog(
      {required BuildContext context,
      required String title,
      required String status,
      required String hintField,
      required UserUmkm? user,
      required TextEditingController controller}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: hintField),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () async {
                switch (status) {
                  case 'edit-username':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: controller.text,
                            umkmname: user.umkmname,
                            email: user.email,
                            password: user.password)
                        .then((value) {
                      GlobalFunctions.scaffoldMessage(
                          context: context,
                          message: 'Data Berhasil diperbarui',
                          color: Colors.green);
                      Navigator.pop(context);
                      print('Update Success');
                    });
                    break;
                  case 'edit-umkmname':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            umkmname: controller.text,
                            email: user.email,
                            password: user.password)
                        .then((value) {
                      GlobalFunctions.scaffoldMessage(
                          context: context,
                          message: 'Data Berhasil diperbarui',
                          color: Colors.green);
                      Navigator.pop(context);
                      print('Update Success');
                    });
                    break;
                  case 'edit-email':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            umkmname: user.email,
                            email: controller.text,
                            password: user.password)
                        .then((value) {
                      GlobalFunctions.scaffoldMessage(
                          context: context,
                          message: 'Data Berhasil diperbarui',
                          color: Colors.green);
                      Navigator.pop(context);
                      print('Update Success');
                    });
                    break;

                  case 'edit-password':
                    await FirebaseServices.updateUser(
                            idUser: user!.id,
                            username: user.username,
                            umkmname: user.email,
                            email: user.email,
                            password: controller.text)
                        .then((value) {
                      GlobalFunctions.scaffoldMessage(
                          context: context,
                          message: 'Data Berhasil diperbarui',
                          color: Colors.green);
                      Navigator.pop(context);
                      print('Update Success');
                    });
                    break;
                  default:
                }
                ;
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      firebaseServices.fetchUSer(uid: auth.currentUser!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorSecondary,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            '${assetIcons}icon-back.png',
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: StreamBuilder<UserUmkm>(
          stream: firebaseServices.streamUserData.stream,
          builder: (context, snapshot) {
            print('${snapshot.data} ini');
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Akun',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(
                            color: kColorPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 49,
                  ),
                  Center(
                    child: Image.asset(
                      '${assetIcons}icon-profile.png',
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-username',
                              user: snapshot.data,
                              context: context,
                              controller: _usernameTextFieldController,
                              hintField: snapshot.data!.username,
                              title: 'Masukan Username Baru'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.username,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama UMKM',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              user: snapshot.data,
                              status: 'edit-umkmname',
                              context: context,
                              controller: _umkmNameTextFieldController,
                              hintField: snapshot.data!.umkmname,
                              title: 'Masukan Nama UMKM Baru'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.umkmname,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-email',
                              user: snapshot.data,
                              context: context,
                              controller: _emailTextFieldController,
                              hintField: snapshot.data!.email,
                              title: 'Masukan Email Baru'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  snapshot.data!.email,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kata Sandi',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                fontFamily: 'Outfit',
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        GestureDetector(
                          onTap: () => _updateDialog(
                              status: 'edit-password',
                              user: snapshot.data,
                              context: context,
                              controller: _passwordTextFieldController,
                              hintField:
                                  isObscure == true ? '********' : '********',
                              title: 'Masukan Password Baru'),
                          child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  isObscure == true
                                      ? '********'
                                      : snapshot.data!.password,
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
