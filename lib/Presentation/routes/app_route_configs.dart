import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Presentation/Screens/WellcomeScreen/well_come_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Forgot/View/forgot_screen.dart';
import 'package:darlemploi/Presentation/Screens/Auth/LogIn/View/login_screen.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Registraion/View/registration_screen_user.dart';
import 'package:darlemploi/Presentation/Screens/SplashScreen/View/splash_screen.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import '../Screens/Auth/Registraion/View/registration_screen_company.dart';
import '../Screens/selectionScreen/selection_screen.dart';

class AppRouter {
  static String currentScreen = '/';
  static GoRouter router = _buildRouter();

  static GoRouter _buildRouter() {
    return GoRouter(
      initialLocation: '/',
      errorPageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('Page Not Found')))),
      routes: [
        GoRoute(
          name: AppRouteConstants.splashScreen,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SplashScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.login,
          path: AppRouteConstants.login,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return  MaterialPage(
              child: LoginScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registration,
          path: AppRouteConstants.registration,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: RegistrationScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.forgot,
          path: AppRouteConstants.forgot,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: ForgotPasswordScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.wellCome,
          path: AppRouteConstants.wellCome,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: WellComeScreen(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.registrationScreenCompany,
          path: AppRouteConstants.registrationScreenCompany,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: RegistrationScreenCompany(),
            );
          },
        ),
        GoRoute(
          name: AppRouteConstants.selectionScreen,
          path: AppRouteConstants.selectionScreen,
          pageBuilder: (context, state) {
            saveLocalData(screenName: state.name!);
            return const MaterialPage(
              child: SelectionScreen(),
            );
          },
        ),
      ],
    );
  }

  static Future<void> saveLocalData({required String screenName}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove(AppRouteConstants.currentScreenName);
      sharedPreferences.setString(
          AppRouteConstants.currentScreenName, screenName);
    } catch (e) {
      if (kDebugMode) {
        print("Error saving local data: $e");
      }
    }
  }

  static Future<void> getLocalData() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (sharedPreferences.getString(AppRouteConstants.currentScreenName) !=
          null) {
        currentScreen =
            sharedPreferences.getString(AppRouteConstants.currentScreenName)!;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting local data: $e");
      }
    }
  }
}
