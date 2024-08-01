import 'package:flutter/material.dart';

class Application_Theme_manager {
  static ThemeData LightThemeData = ThemeData(
      primaryColor: Color(0xFFB7935F),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "El Messiri",
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFB7935F),
        selectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 16),
        unselectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 14),
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF222222),
        selectedIconTheme: IconThemeData(size: 35, color: Color(0xFF222222)),
        unselectedItemColor: Color(0xFFF8F8F8),
        unselectedIconTheme: IconThemeData(size: 28, color: Color(0xFFF8F8F8)),
      ),
      dividerTheme: DividerThemeData(color: Color(0xFFB7935F)),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ));
  static ThemeData DarkThemeData = ThemeData(
      primaryColorDark: Color(0xFFFACC1D),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: "El Messiri",
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141A2E),
        selectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 16),
        unselectedLabelStyle: TextStyle(fontFamily: "El Messiri", fontSize: 14),
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFFFACC1D),
        selectedIconTheme: IconThemeData(size: 35, color: Color(0xFFFACC1D)),
        unselectedItemColor: Color(0xFFF8F8F8),
        unselectedIconTheme: IconThemeData(size: 28, color: Color(0xFFF8F8F8)),
      ),
      
      dividerTheme: DividerThemeData(color: Color(0xFFFACC1D),thickness: 2),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ));
}
