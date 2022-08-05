import 'package:flutter/material.dart';
import 'package:tutorial/202/theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = true;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? LightTheme().theme : ThemeData.dark();
}
