import 'package:flutter/material.dart';

/// Global context for managing theme toggle across the entire app
class AppThemeContext {
  static late VoidCallback _onThemeToggle;

  static void setThemeToggleCallback(VoidCallback callback) {
    _onThemeToggle = callback;
  }

  static void toggleTheme() {
    _onThemeToggle();
  }
}
