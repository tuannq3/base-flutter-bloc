import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class StyleUtils {
  ThemeData primaryTheme() => ThemeData.light().copyWith(
        primaryColor: ColorUtils.primary,
        scaffoldBackgroundColor: ColorUtils.colorWhiteBackground,
        appBarTheme: primaryAppbarTheme,
        elevatedButtonTheme: primaryElevatedButtonTheme,
        bottomNavigationBarTheme: primaryBottomNavigationBarTheme,
      );

  static final primaryElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: ColorUtils.primary,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );

  static const primaryAppbarTheme = AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    color: ColorUtils.primary,
    iconTheme: IconThemeData(color: Colors.white, size: 24.0),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    titleSpacing: 0,
  );

  static const primaryBottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: ColorUtils.primary,
    unselectedItemColor: Colors.black54,
    selectedLabelStyle: TextStyle(fontSize: 12, color: ColorUtils.primary),
    unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.black54),
    type: BottomNavigationBarType.fixed,
  );

  static const primaryTextStyle = TextStyle(
    color: ColorUtils.primary,
    fontSize: 14,
  );
}
