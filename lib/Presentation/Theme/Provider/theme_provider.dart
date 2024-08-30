import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/app_constant.dart';

class ThemeProvider with ChangeNotifier {
  final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Comfortaa_SemiBold',
    primaryColor: const Color(0xffF68D58),
    cardColor: const Color(0xffDEE6E2),
    scaffoldBackgroundColor: const Color(0xff173E7D),
    shadowColor: Colors.black,
    highlightColor: Colors.white,
    dialogBackgroundColor: const Color(0xffD9D9D9),
    indicatorColor: const Color(0xffD9D9D9),
    dividerColor: Colors.white,
    hintColor: Colors.white,
  );

  final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Comfortaa_SemiBold',
    primaryColor: const Color(0xffF68D58),
    cardColor: const Color(0xffDEE6E2),
    scaffoldBackgroundColor: const Color(0xff173E7D),
    shadowColor: Colors.white,
    canvasColor: Colors.white,
    dialogBackgroundColor: const Color(0x54888888),
    hintColor: Colors.white,
    indicatorColor: const Color(0xff283349),
    dividerColor: Colors.white,
  );

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;

  // Todo my code
  Future<void> initializeTheme() async {
    getStoreValue().then((themeBoolValue) {
      var themeMode = themeBoolValue ?? true; // Change the default to true (dark theme)
      if (themeMode == false) {
        _themeData = lightTheme;
      } else {
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  bool? _setTheme;

  bool? gettTheme() => _setTheme;

  Future<bool?> getStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    var themeBoolValue = prefs.getBool("themeValue");
    if (themeBoolValue == null) {
      // Set the default theme to darkTheme when themeValue is not found
      themeBoolValue = true;
      await prefs.setBool("themeValue", true);
    }
    AppConstant.themValue = themeBoolValue;
    notifyListeners();
    return themeBoolValue;
  }

  void setTheme({required bool themeValue}) async {
    _setTheme = themeValue;
    AppConstant.themValue = themeValue;
    notifyListeners();
    if (themeValue == false) {
      _themeData = lightTheme;
      saveData('themeMode', themeValue);
    } else {
      _themeData = darkTheme;
      saveData('themeMode', themeValue);
    }
  }
  static Future<void> saveData(String key,value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
    }
  }
}