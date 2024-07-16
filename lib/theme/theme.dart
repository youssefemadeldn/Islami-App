import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/constants.dart';

ThemeData lightTheme() => ThemeData(
      // colorScheme to background of container
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: LightAppColors.kPrimaryColor,
        onPrimary: LightAppColors.kSecondlyColor,
        secondary: LightAppColors.kPrimaryColor,
        onSecondary: LightAppColors.kPrimaryColor,
        error: LightAppColors.kPrimaryColor,
        onError: LightAppColors.kPrimaryColor,
        surface: LightAppColors.kPrimaryColor,
        onSurface: LightAppColors.kPrimaryColor,
      ),
      //scaffoldBackgroundColor
      scaffoldBackgroundColor: Colors.white,
      // dividerTheme
      dividerTheme: const DividerThemeData(
        color: LightAppColors.dividerColor,
        thickness: 3,
      ),
      // cardTheme
      cardTheme: const CardTheme(
        color: LightAppColors.cardColor,
      ),
      // textTheme
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: Colors.black,
        ),
        headlineMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: Colors.black,
        ),
      ),
// iconButtonTheme
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      //bottomNavigationBarTheme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
      ),

      // switchTheme: SwitchThemeData()
    );

ThemeData darkTheme() => ThemeData(
      scaffoldBackgroundColor: DarkAppColors.kPrimaryColor,
      // dividerTheme
      dividerTheme: const DividerThemeData(
        color: DarkAppColors.dividerColor,
        thickness: 3,
      ),
      // cardTheme
      cardTheme: const CardTheme(
        color: DarkAppColors.cardColor,
      ),
      // textTheme
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 25,
          color: Colors.yellow,
        ),
      ),
      // iconButtonTheme
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.yellow),
        ),
      ),
      // colorScheme to background of container
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: DarkAppColors.kPrimaryColor,
        onPrimary: DarkAppColors.kPrimaryColor,
        secondary: DarkAppColors.kSecondlyColor,
        onSecondary: DarkAppColors.kPrimaryColor,
        error: DarkAppColors.kPrimaryColor,
        onError: DarkAppColors.kPrimaryColor,
        surface: DarkAppColors.kPrimaryColor,
        onSurface: DarkAppColors.kPrimaryColor,
      ),
      //bottomNavigationBarTheme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
      ),

      // switchTheme: SwitchThemeData()
    );
