import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(accentColor: Color(0xffff8e3c)),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow),
    brightness: Brightness.light,
  );
}
