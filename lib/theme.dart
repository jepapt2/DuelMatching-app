import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "Noto Sans JP",
    scaffoldBackgroundColor: Color(0xfffffffe),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Color(0xffff8e3c),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        actionsIconTheme: IconThemeData(color: Color(0xffff8e3c)),
        iconTheme: IconThemeData(color: Color(0xffff8e3c)),
        shape: Border(bottom: BorderSide(color: Colors.black38)),
        centerTitle: true,
        elevation: 10.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xffeff0f3),
        unselectedItemColor: Color(0xff2a2a2a),
        selectedItemColor: Color(0xffff8e3c),
        elevation: 10.0),
    brightness: Brightness.light,
  );
}
