import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;
  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white54.withOpacity(0.8),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          onPrimary: Colors.pink,
          onSecondary: _lightColor.blueMenia,
        ),
      ),
      colorScheme: const ColorScheme.light(),
      textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
              fontSize: 25,
              color: _lightColor._textColor,
            ),
          ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(
          color: Colors.green,
        ),
        fillColor: MaterialStateProperty.all(Colors.green),
      ),
    );
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 98, 9, 9);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}
