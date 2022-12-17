import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/services/api_services.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/presentation/pages/article_list_page.dart';
import 'package:pajakin/presentation/pages/article_web_view.dart';
import 'package:pajakin/presentation/pages/login_page.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/presentation/pages/pajak_page.dart';
import 'package:pajakin/presentation/pages/pemasukan_page.dart';
import 'package:pajakin/presentation/pages/pengeluaran_page.dart';
import 'package:pajakin/presentation/pages/splash_screen.dart';
import 'package:pajakin/presentation/providers/news_provider.dart';
import 'package:pajakin/presentation/providers/scheduling_provider.dart';
import 'package:pajakin/utils/background_service.dart';
import 'package:pajakin/utils/notification_helper.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationService.initNotification();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsProvider>(
          create: (_) => NewsProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
        )
      ],
      child: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          return MaterialApp(
            title: 'Pajakin',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(primary: kColorPrimary),
            ),
            debugShowCheckedModeBanner: false,
            home:
                snapshot.data == null ? const SplashScreen() : const HomePage(),
            onGenerateRoute: (RouteSettings setting) {
              switch (setting.name) {
                case Routes.HOME_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  );

                case Routes.REGISTER_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  );

                case Routes.LOGIN_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  );

                case Routes.BERITA_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const ArticleListPage(),
                  );

                case Routes.WEB_VIEW_PAGE:
                  final url = setting.arguments as String;
                  return MaterialPageRoute(
                    builder: (context) => ArticleWebView(url: url),
                  );

                case Routes.PAJAK_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const PajakPage(),
                  );

                case Routes.SETTINGS_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  );

                case Routes.INFORMATION_ACCOUNT_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const InformationAccountPage(),
                  );

                case Routes.KAS_PAGE:
                  return MaterialPageRoute(
                    builder: (context) => const BukuKasPage(),
                  );

                case Routes.PEMASUKAN_PAGE:
                  final data = setting.arguments as Map<String, dynamic>;
                  return MaterialPageRoute(
                    builder: (context) => PemasukanPage(
                      data: data,
                    ),
                  );

                case Routes.PENGELUARAN_PAGE:
                  final data = setting.arguments as Map<String, dynamic>;
                  return MaterialPageRoute(
                    builder: (context) => PengeluaranPage(
                      data: data,
                    ),
                  );

                default:
                  return MaterialPageRoute(
                    builder: (context) => const Scaffold(
                      body: Center(
                        child: Text('Page Not Found :('),
                      ),
                    ),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
