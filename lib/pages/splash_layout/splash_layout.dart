import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoc8/hom_layout/home_layout.dart';
import 'package:todoc8/provider/settings_provider.dart';

class SplashLayout extends StatefulWidget {
  static const String routeName = "splash_layout";

  @override
  State<SplashLayout> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<SplashLayout> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            settingsProvider.getMainBackground(),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
