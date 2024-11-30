import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for the theme.
class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);

  bool get isDarkMode => state;

  void toggleTheme() {
    state = !state;
  }

  void setTheme(bool isDarkMode) {
    state = isDarkMode;
  }
}

/// Provider for the theme.
final changedThemeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
