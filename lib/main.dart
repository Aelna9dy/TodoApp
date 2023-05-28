import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoc8/hom_layout/home_layout.dart';
import 'package:todoc8/pages/splash_layout/splash_layout.dart';
import 'package:todoc8/provider/settings_provider.dart';
import 'package:todoc8/shared/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingProvider.currentTheme,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        SplashLayout.routeName: (context) => SplashLayout(),
      },
      initialRoute: SplashLayout.routeName,
    );
  }
}
