import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/theme.dart';
import 'package:todo_app/Ui/Splash/splash_screen.dart';
import 'package:todo_app/Ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      initialRoute: SplashScreen.routName,
      routes: {
        SplashScreen.routName: (context) => SplashScreen(),
        HomePage.routName: (context) => HomePage(),
      },
    );
  }
}
