import 'package:TribalTrove/view/constants/global_variables.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // primarySwatch:GlobalVariables.backgroundColor,
      scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      fontFamily: 'Inter Regular',

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
      ));
}
