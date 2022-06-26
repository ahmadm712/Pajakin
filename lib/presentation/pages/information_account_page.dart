import 'package:pajakin/data/models/user_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class InformationAccountPage extends StatefulWidget {
  const InformationAccountPage({Key? key}) : super(key: key);

  @override
  State<InformationAccountPage> createState() => _InformationAccountPageState();
}

class _InformationAccountPageState extends State<InformationAccountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              if (snapshot.hasData) {}
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
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
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
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
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
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
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
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
                  Center(
                    child: SizedBox(
                      width: 154,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kColorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          GlobalFunctions.scaffoldMessage(
                              context: context,
                              message: 'Informasi telah tersimpan',
                              color: Colors.green);
                        },
                        child: const Text(
                          'Simpan',
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
