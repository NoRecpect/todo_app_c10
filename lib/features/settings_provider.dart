import 'package:flutter/material.dart';
import 'package:todo_app/features/settings/pages/settings_view.dart';
import 'package:todo_app/features/tasks/pages/tasks_view.dart';

class SettingsProvider extends ChangeNotifier {
  int currentIndex = 0;
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = "en";
  List<Widget> screens = [
    TasksView(),
    SettingsView(),
  ];

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  changeLanguage(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
