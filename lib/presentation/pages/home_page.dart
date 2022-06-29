import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/models/user_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/presentation/widgets/button_menu.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/notification_helper.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationService notificationService = NotificationService();
  @override
  void initState() {
    super.initState();
    notificationService.configureSelectNotificationSubject(Routes.PAJAK_PAGE);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  User user = auth.currentUser!;

  @override
  Widget build(BuildContext context) {
    final size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<UserUmkm>(
          future: FirebaseServices.fetchUSer(uid: auth.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.INFORMATION_ACCOUNT_PAGE);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            '${assetIcons}icon-profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.username,
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(color: Colors.white, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                '${assetIcons}icon-umkm.png',
                                height: 21,
                                width: 21,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                snapshot.data!.umkmname,
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width,
                    height: 178,
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Pemasukan',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              'Rp 0 ',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              'Total Pengeluaran',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              'Rp 0 ',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              'Selisih',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              'Rp 0 ',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: kColorPrimary,
                                width: 2,
                              )),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '0%',
                                  style: GlobalFunctions.textTheme(
                                          context: context)
                                      .headline3!
                                      .copyWith(
                                        color: kColorPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Pengeluaran',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonMenu(
                        imgAssets: '${assetIcons}icon-pajak.png',
                        title: 'Pajak',
                        routeName: Routes.PAJAK_PAGE,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ButtonMenu(
                        imgAssets: '${assetIcons}icon-bukukas.png',
                        title: 'Buku Kas',
                        routeName: Routes.KAS_PAGE,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonMenu(
                        imgAssets: '${assetIcons}icon-berita.png',
                        title: 'Berita',
                        routeName: Routes.BERITA_PAGE,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ButtonMenu(
                        imgAssets: '${assetIcons}icon-settings.png',
                        title: 'Pengaturan',
                        routeName: Routes.SETTINGS_PAGE,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Text(
                      'PajakIn Mobile',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                  )
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
