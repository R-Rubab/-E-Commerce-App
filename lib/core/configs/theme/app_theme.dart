import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
      primaryColor: EColors.primary,
      scaffoldBackgroundColor: EColors.background,
      brightness: Brightness.dark,
      fontFamily: 'CircularStd',
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.gelasio(
          color: Colors.white,
          fontSize: 20.sp,
          letterSpacing: .8,
          // fontWeight: FontWeight.bold,
        ),
        bodyMedium: GoogleFonts.gelasio(
          color: EColors.white,
          fontSize: 20.sp,
          letterSpacing: .4,
          // fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.gelasio(
          color: EColors.white,
          fontSize: 23.sp,
          letterSpacing: .8,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.gelasio(
          color: EColors.black,
          fontSize: 20.sp,
          letterSpacing: .4,
          fontWeight: FontWeight.bold,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: EColors.background,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: EColors.secondBackground,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: EColors.primary,
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)))));
}
