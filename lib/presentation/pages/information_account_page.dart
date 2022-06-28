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
  final TextEditingController _usernameTextFieldController =
      TextEditingController();
  final TextEditingController _umkmNameTextFieldController =
      TextEditingController();
  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  _usernameDialog(BuildContext context, UserUmkm? user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Username'),
          content: TextField(
            controller: _usernameTextFieldController,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration:
                const InputDecoration(hintText: 'Masukan Username baru'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () async {
                await FirebaseServices.updateUser(
                        idUser: user!.id,
                        username: _usernameTextFieldController.text,
                        umkmname: user.umkmname,
                        email: user.email,
                        password: user.password)
                    .then((value) {
                  Navigator.pop(context);
                  print('Update Success');
                });
              },
            )
          ],
        );
      },
    );
  }

  _updateDialog(
      {required BuildContext context,
      required String title,
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
                await FirebaseServices.updateUser(
                        idUser: user!.id,
                        username: user.username,
                        umkmname: controller.text,
                        email: user.email,
                        password: user.password)
                    .then((value) {
                  GlobalFunctions.scaffoldMessage(
                      context: context,
                      message: 'Nama UMKM Berhasil diperbarui',
                      color: Colors.green);
                  Navigator.pop(context);
                  print('Update Success');
                });
              },
            )
          ],
        );
      },
    );
  }

  _emailDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Email'),
          content: TextField(
            controller: _emailTextFieldController,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(hintText: 'Masukan Email baru'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () {
                Navigator.of(context).pop();
                GlobalFunctions.scaffoldMessage(
                    context: context,
                    message: 'Email Berhasil diperbarui',
                    color: Colors.green);
              },
            )
          ],
        );
      },
    );
  }

  _passwordDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Kata Sandi'),
          content: TextField(
            controller: _passwordTextFieldController,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration:
                const InputDecoration(hintText: 'Masukan Kata Sandi baru'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Simpan'),
              onPressed: () {
                Navigator.of(context).pop();
                GlobalFunctions.scaffoldMessage(
                    context: context,
                    message: 'Kata Sandi Berhasil diperbarui',
                    color: Colors.green);
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
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
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
        child: FutureBuilder<UserUmkm>(
          future: FirebaseServices.fetchUSer(uid: auth.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () => _updateDialog(
                                user: snapshot.data,
                                context: context,
                                controller: _usernameTextFieldController,
                                hintField: snapshot.data!.username,
                                title: 'Masukan Nama Umkm'),
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
                                  ),
                                ],
                              ),
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
                              context: context,
                              controller: _umkmNameTextFieldController,
                              hintField: 'Masukan nama umkm',
                              title: 'Masukan Nama Umkm'),
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
                        Container(
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
                              TextButton(
                                onPressed: () => _emailDialog(context),
                                child: Text(
                                  '${auth.currentUser!.email}',
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
                              ),
                            ],
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
                        Container(
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
                              TextButton(
                                onPressed: () => _passwordDialog(context),
                                child: Text(
                                  snapshot.data!.password,
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
                              ),
                            ],
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
