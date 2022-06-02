import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = '/route_splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Timer(
    //   const Duration(seconds: 2),
    //       () => Navigator.pushReplacementNamed(context, ListResponse.routeName),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/SplashScreen.jpg'),
      ),
    );
  }
}
