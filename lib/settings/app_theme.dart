import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      backgroundColor: Colors.grey.shade900,
      primaryColor: const Color(0xFFFC8019),
      textTheme: TextTheme(overline: TextStyle(color: Colors.white)),
      colorScheme: const ColorScheme.dark());

  static final lightTheme = ThemeData(
      primaryColor: const Color(0xFFFC8019),
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      textTheme: TextTheme(overline: TextStyle(color: Colors.black)),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: const Color(0xfffc8019),
          ));
}
