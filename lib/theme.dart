import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      fontFamily: "Noto Sans JP",
      scaffoldBackgroundColor: const Color(0xfffffffe),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xffff8e3c),
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: Color(0xffff8e3c),
        disabledColor: Color(0xffeff0f3),
        selectedColor: Color(0xfffffffe),
        secondarySelectedColor: Color(0xffff8e3c),
        padding: EdgeInsets.all(3.0),
        labelStyle: TextStyle(),
        secondaryLabelStyle: TextStyle(),
        brightness: Brightness.light,
        deleteIconColor: Color(0xfffffffe),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfffffffe),
          foregroundColor: Color(0xff2a2a2a),
          actionsIconTheme: IconThemeData(color: Color(0xffff8e3c)),
          iconTheme: IconThemeData(color: Color(0xffff8e3c)),
          shape: Border(bottom: BorderSide(color: Colors.black38)),
          toolbarTextStyle: TextStyle(color: Color(0xff2a2a2a)),
          centerTitle: true,
          elevation: 5.0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xffeff0f3),
          unselectedItemColor: Color(0xff2a2a2a),
          selectedItemColor: Color(0xffff8e3c),
          elevation: 10.0),
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xff2a2a2a), fontSize: 15.0),
          floatingLabelStyle:
              TextStyle(color: Color(0xff2a2a2a), fontSize: 15.0),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2a2a2a)))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff2a2a2a))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xffff8e3c),
              textStyle: const TextStyle(
                  color: Color(0xffeff0f3), fontWeight: FontWeight.bold))));
}
