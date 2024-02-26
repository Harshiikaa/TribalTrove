import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/config/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

static getApplicationTheme(bool isDark) {
  return ThemeData(
    // primarySwatch:GlobalVariables.backgroundColor,
    scaffoldBackgroundColor: GlobalVariables.backgroundColor,
    fontFamily: 'Inter Regular',

     // change the theme according to the user choice
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: ThemeConstant.darkPrimaryColor,
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 17, 119, 20),
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      // fontFamily: 'Montserrat',
      useMaterial3: true,

 // Change app bar color
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ThemeConstant.appBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),

      
    // theme for elevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter Regular'),
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    // theme for textFormfiled
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(10), // Adjust internal padding
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: GlobalVariables.outlineColor),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: GlobalVariables.outlineColor),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: GlobalVariables.greyBackgroundColor,
      hintStyle: TextStyle(color: GlobalVariables.greyColor),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue,
    ),
  );
}
}
