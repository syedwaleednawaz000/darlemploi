import 'dart:async';
import 'dart:convert';

import 'package:darlemploi/Presentation/Screens/CompanyHome/companay_home_screen.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:darlemploi/Presentation/Screens/selectionScreen/selection_screen.dart';
import 'package:darlemploi/config/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  static const currentScreen = "currentScreen";
  String? _currentScreen;

  SplashProvider() {
    /// Load theme status when ThemeProvider is created
    loadScreen();
  }

  get getCurrentScreen => _currentScreen;

  void setScreen(String currentScreen) {
    ///we don't accept other locales(languages without defined in all )
    _currentScreen = currentScreen;
    _setScreen(currentScreen);
    notifyListeners();
  }

  void clearLocale() {
    _currentScreen = null;
    notifyListeners();
  }

  loadScreen() async {
    _currentScreen = await _getScreen();
    notifyListeners();
  }



  void _setScreen(String currentScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentScreen, currentScreen);
  }

  Future<String> _getScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(currentScreen) ?? " ";
  }

  Future<void> checkUserLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2), () {
      String? userDataString = prefs.getString(AppConstant.saveUserdata);

      if (userDataString != null) {

        // Decode the JSON string into a Map
        Map<String, dynamic> userData = jsonDecode(userDataString);
        print("This is user data ${userData['token']}");
        AppConstant.getUserToken = userData['token'].toString();
            AppConstant.getUserID = userData['user']['id'].toString();
        if (userData['user']['type'] == "employee") {
          Get.offAll(() => const UserHomeScreen());
        } else if (userData['user']['type'] == "recruiter") {
          Get.offAll(() => const CompanyHomeScreen());
        }
      } else {
        Get.offAll(() => const SelectionScreen());
      }
    });
  }
}
