import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff00B894);
  static const Color secondary = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // elevatedButtonTheme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: secondary,
        shape: const StadiumBorder(),
        elevation: 8,
      )),
      // inputDecorationTheme
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(
          color: primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: primary,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: primary,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        labelStyle: const TextStyle(
          color: primary,
          fontSize: 14,
        ),
      ),
      // textButtonTheme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)));
}
