import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/config/constants/theme_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme(bool isDark) {
    return ThemeData(
      // scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      // fontFamily: 'Inter Regular',

      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: Color.fromARGB(255, 141, 139, 137),
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 17, 119, 20),
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      // fontFamily: 'Montserrat',
      useMaterial3: true,

      // Change app bar color
      // appBarTheme: const AppBarTheme(
      //   elevation: 0,
      //   backgroundColor: isDark
      //       ? const Color.fromARGB(
      //           255, 106, 103, 103) // Adjusted color for dark mode
      //       : const Color.fromARGB(255, 22, 81, 24),
      //   centerTitle: true,
      //   titleTextStyle: TextStyle(
      //     color: Colors.white,
      //     fontSize: 20,
      //   ),
      //   iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      // ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: isDark
            ? const Color.fromARGB(
                255, 106, 103, 103) // Adjusted color for dark mode
            : Colors.white,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      ),

      // theme for elevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isDark
              ? Colors.grey // Adjusted color for dark mode
              : Color.fromARGB(255, 123, 212, 123),
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

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ThemeConstant.primaryColor,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }
}
