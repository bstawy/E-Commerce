import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData applicationTheme = ThemeData(
    // Color scheme configuration
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff004182),
      primary: const Color(0xff004182),
      onPrimary: const Color(0xff06004F),
      background: const Color(0xffffffff),
      onBackground: const Color(0xff004182).withOpacity(0.3),
      secondary: const Color(0xff000000).withOpacity(0.7),
      onSecondary: const Color(0xFFEDF1F5),
    ),

    // App bar theme configuration
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xff004182),
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Bottom nav bar theme configuration
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff004182),
      elevation: 0,
      unselectedLabelStyle: TextStyle(fontSize: 0),
      selectedLabelStyle: TextStyle(fontSize: 0),
      enableFeedback: true,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),

    // Text theme configuration
    fontFamily: "Poppins",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Color(0xff004182),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: Color.fromARGB(255, 5, 5, 5),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Color(0xff004182),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
