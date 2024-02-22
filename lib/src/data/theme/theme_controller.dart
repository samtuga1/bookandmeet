import 'package:bookandmeet/src/interfaces/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals.dart';

class ThemeController implements IThemeController {
  final themeMode = signal<ThemeMode>(ThemeMode.dark);

  @override
  void changeThemeMode(ThemeMode mode) {
    themeMode.value = mode;
  }
}
