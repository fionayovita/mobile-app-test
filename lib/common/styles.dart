import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFFFFFFFF);
final Color secondaryColor = Color(0xFF2B637B);
final Color textColor = Colors.grey.shade600;

final TextTheme myTextTheme = TextTheme(
  headline4: GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
  headline5: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  headline6: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor),
  subtitle1: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  subtitle2: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.1),
  bodyText1: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.black),
  bodyText2: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
      color: Colors.grey.shade600),
);

final themeData = ThemeData(
  textTheme: myTextTheme,
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        textStyle: TextStyle(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)))),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: Colors.grey,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: primaryColor,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: primaryColor),
      borderRadius: BorderRadius.circular(15),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: Colors.red),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: primaryColor, width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: primaryColor, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    ),
  ),
);
