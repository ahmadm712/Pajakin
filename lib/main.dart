import 'package:flutter/material.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/presentation/pages/pemasukan_page.dart';
import 'package:pajakin/presentation/widgets/pemasukan_card.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pajakin',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: kColorPrimary)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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

          case Routes.KAS_PAGE:
            return MaterialPageRoute(
              builder: (context) => const BukuKasPage(),
            );

          case Routes.PENGELUARAN_PAGE:
            final String status = setting.arguments as String;
            return MaterialPageRoute(
              builder: (context) => PemasukanPage(
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
    );
  }
}
