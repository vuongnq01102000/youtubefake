import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  bool get isModeSystem => themeMode == ThemeMode.system;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // listen state notify from themeprovider extend changeno
  }
}

class Mytheme {
  static final lightModeTheme = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
