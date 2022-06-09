import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/presentation/pages/login_page.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isNotif = false;

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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengaturan',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.INFORMATION_ACCOUNT_PAGE);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: kColorPrimary,
                                size: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 22,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Informasi Akun',
                                    style: GlobalFunctions.textTheme(
                                            context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF14181B),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.notifications_active,
                              color: Color(0xFF005478),
                              size: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notifikasi',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        fontFamily: 'Outfit',
                                        color: const Color(0xFF14181B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: isNotif,
                            onChanged: (value) {
                              setState(() {
                                isNotif = !isNotif;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Icon(
                                Icons.logout,
                                color: kColorPrimary,
                                size: 24,
                              ),
                            ),
                            const SizedBox(
                              width: 22,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Keluar',
                                    style: GlobalFunctions.textTheme(
                                            context: context)
                                        .headline3!
                                        .copyWith(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF14181B),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
