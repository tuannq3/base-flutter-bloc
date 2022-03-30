import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getLight() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
    );
  }
}
