import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff00B894);
  static const Color secondary = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: secondary,
        shape: const StadiumBorder(),
        elevation: 5,
      )
    ),

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  const BorderSide(color: primary)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10),
        ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      )
    )
  );
}