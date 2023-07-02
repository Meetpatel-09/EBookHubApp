import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      primarySwatch: Colors.brown,
      primaryColor: primaryColor,
      hintColor: primaryColor2,
      backgroundColor: Colors.brown.shade100,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor,
      ));
  static ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        // backgroundColor: ,
        color: Color(0xFF6A2B05),
        elevation: 0,
      ),
      primaryColor: whitishColor,
      hintColor: primaryColor2,
      backgroundColor: primaryColor,
      // canvasColor: Colors.,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
      ));

  static Color primaryColor = const Color(0xFF835941);
  static Color secondaryColor = const Color(0xFF964315);
  static Color accentColor = const Color(0xFFBB6B24);
  static Color primaryColor2 = const Color(0xFF7A4526);
  static Color whitishColor = const Color(0xFFe6f3ec);
}