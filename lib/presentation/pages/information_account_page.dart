import 'package:firebase_auth/firebase_auth.dart';
import 'package:pajakin/data/models/user_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class InformationAccountPage extends StatefulWidget {
  InformationAccountPage({Key? key}) : super(key: key);

  @override
  State<InformationAccountPage> createState() => _InformationAccountPageState();
}

class _InformationAccountPageState extends State<InformationAccountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSigningOut = false;

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
                print(snapshot.data!.email);
              }
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
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USERNAME',
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color.fromARGB(
                                              255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Text(
                                '${snapshot.data!.username}',
                                style:
                                    GlobalFunctions.textTheme(context: context)
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
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NAMA UMKM',
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color.fromARGB(
                                              255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Text(
                                snapshot.data!.umkmname,
                                style:
                                    GlobalFunctions.textTheme(context: context)
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
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EMAIL',
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color.fromARGB(
                                              255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Text(
                                '${auth.currentUser!.email}',
                                style:
                                    GlobalFunctions.textTheme(context: context)
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
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KATA SANDI',
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color.fromARGB(
                                              255, 158, 158, 158),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Text(
                                '********',
                                style:
                                    GlobalFunctions.textTheme(context: context)
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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
                          Navigator.pushNamed(
                              context, Routes.CHANGE_PASSWORD_PAGE);
                        },
                        child: const Text(
                          'Ubah Kata Sandi',
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
