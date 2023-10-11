import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/Ui/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routName = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomePage.routName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        "assets/images/splash_light.png",
      ),
      fit: BoxFit.fill,
    );
  }
}
