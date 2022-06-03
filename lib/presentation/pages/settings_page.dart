import 'package:flutter/material.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-0.85, 0),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF005478),
                          size: 24,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.75, 0),
                      child: Text(
                        'Pengaturan',
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                              fontFamily: 'Inter',
                              color: const Color(0xFF005478),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                            Navigator.pushNamed(context, Routes.PROFILE_PAGE);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 12, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: const Color(0xFFF1F4F8),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Icon(
                                        Icons.account_circle_outlined,
                                        color: Color(0xFF005478),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
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
                                                  color:
                                                      const Color(0xFF14181B),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                        ),
                        const Divider(),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 8, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFFF1F4F8),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: Color(0xFF005478),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 8, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFFF1F4F8),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Icon(
                                      Icons.logout,
                                      color: Color(0xFF005478),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
