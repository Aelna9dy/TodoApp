import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Shared_Components/color.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.roboto(fontSize: 12, color: Colors.black)),
  );
}
