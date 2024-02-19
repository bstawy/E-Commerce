import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData applicationTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff004182),
      primary: const Color(0xff004182),
      background: const Color(0xffffffff),
      onBackground: const Color(0xff004182).withOpacity(0.3),
      secondary: const Color(0xff000000).withOpacity(0.7),
    ),
    textTheme: TextTheme(),
  );
}
