import 'package:flutter/material.dart';
import 'package:pajakin/data/services/api_services.dart';
import 'package:pajakin/presentation/pages/article_detail_page.dart';
import 'package:pajakin/presentation/pages/article_list_page.dart';
import 'package:pajakin/presentation/pages/article_web_view.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/presentation/providers/news_provider.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
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

          case Routes.BERITA_PAGE:
            return MaterialPageRoute(
              builder: (context) => const ArticleListPage(),
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
    )
    );
  }
}
