import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/theme.dart';
import 'package:todo_app/Ui/Login/login_screen.dart';
import 'package:todo_app/Ui/Register/register.dart';
import 'package:todo_app/Ui/Splash/splash_screen.dart';
import 'package:todo_app/Ui/home_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        RegisterScreen.routName: (context) => RegisterScreen(),
        LoginScreen.routName: (context) => LoginScreen(),
      },
    );
  }
}
