import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pajakin/presentation/pages/login_page.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: Center(
        child: Center(
          child: Image.asset(
            '${assetImages}splash_screen.jpg',
          ),
        ),
      ),
    );
  }
}
