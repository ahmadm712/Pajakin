import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/services/api_services.dart';
import 'package:pajakin/presentation/pages/article_list_page.dart';
import 'package:pajakin/presentation/pages/article_web_view.dart';
import 'package:pajakin/presentation/pages/login_page.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/presentation/pages/pajak_page.dart';
import 'package:pajakin/presentation/pages/pemasukan_page.dart';
import 'package:pajakin/presentation/pages/pengeluaran_page.dart';
import 'package:pajakin/presentation/pages/settings_page.dart';
import 'package:pajakin/presentation/pages/splash_screen.dart';
import 'package:pajakin/presentation/providers/news_provider.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            create: (_) => NewsProvider(apiService: ApiService()),
          ),
        ],
        child: MaterialApp(
          title: 'Pajakin',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(primary: kColorPrimary),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
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

              case Routes.CHANGE_PASSWORD_PAGE:
                return MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                );
              case Routes.KAS_PAGE:
                return MaterialPageRoute(
                  builder: (context) => const BukuKasPage(),
                );

              case Routes.PEMASUKAN_PAGE:
                final String status = setting.arguments as String;
                return MaterialPageRoute(
                  builder: (context) => PemasukanPage(
                    status: status,
                  ),
                );

              case Routes.PENGELUARAN_PAGE:
                final String status = setting.arguments as String;
                return MaterialPageRoute(
                  builder: (context) => PengeluaranPage(
                    status: status,
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
        ));
  }
}
