import 'package:flutter/material.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/utils/routes.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
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
