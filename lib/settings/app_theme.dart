import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      cardColor: Colors.grey.shade900,
      backgroundColor: Colors.grey.shade900,
      primaryColor: const Color(0xFFFC8019),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(overline: TextStyle(color: Colors.white)),
      colorScheme: const ColorScheme.dark());

  static final lightTheme = ThemeData(
      primaryColor: const Color(0xFFFC8019),
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(overline: TextStyle(color: Colors.black)),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: const Color(0xfffc8019),
          ));
}
