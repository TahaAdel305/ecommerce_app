import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class appTheme{
  static ThemeData lightTheme = ThemeData(
    brightness:  Brightness.light,
    scaffoldBackgroundColor: appColor.background_light,
    colorScheme: ColorScheme.light(primary: appColor.colorscandery),

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: appColor.textlight,
      displayColor: appColor.textlight,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColor.navigationBarLight,
      selectedItemColor: appColor.navigationSelectedLight,
      unselectedItemColor: appColor.navigationUnselectedLight,
    ),

  );

  //dark
  static ThemeData darkTheme = ThemeData(
    brightness:  Brightness.dark,
    scaffoldBackgroundColor: appColor.background_dark,
    colorScheme: ColorScheme.dark(primary: appColor.colorscandery),

    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: appColor.textdark,
      displayColor: appColor.textdark,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColor.navigationBarDark,
      selectedItemColor: appColor.navigationSelectedDark,
      unselectedItemColor: appColor.navigationUnselectedDark,
    ),
  );
}