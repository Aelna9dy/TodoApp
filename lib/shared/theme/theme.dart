import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoc8/shared/theme/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    accentColor: Colors.white,
    scaffoldBackgroundColor: lightGreenColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 36,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: lightGreyColor,
        size: 36,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    accentColor: Colors.black,
    scaffoldBackgroundColor: darkModeColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 36,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: lightGreyColor,
        size: 36,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        color: Colors.grey,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.grey,
        fontSize: 15,
      ),
    ),
  );
}
