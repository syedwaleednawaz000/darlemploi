import 'dart:async';
import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Screens/Auth/LogIn/View/login_screen.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:darlemploi/Presentation/Screens/WellcomeScreen/welcome_provider.dart';
import 'package:provider/provider.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import '../../Widget/custom_bg.dart';

class WellComeScreen extends StatelessWidget {
  const WellComeScreen({super.key});

  Future<String?> _getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userType');
  }

  void _handleCreateAccount(BuildContext context) async {
    String? userType = await _getUserType();
    if (userType == 'candidate') {
      context.go(AppRouteConstants.registration);
    } else {
      context.go(AppRouteConstants.registrationScreenCompany);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackGround(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Images/logo.png', width: 250),
          Text(
            AppTranslations.of(context).welcomeTo,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Image.asset('assets/Images/name_logo.png', width: 400, height: 80),
          Text(
            AppTranslations.of(context).getYourselfJob,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          MyButton(
            title: AppTranslations.of(context).createAnAccount,
            onTap: () {
              Provider.of<WelcomeScreenProvider>(context,listen: false).handleCreateAccount(context: context,);
            }
          ),
          const SizedBox(height: 15),
          MyButton(
            title: AppTranslations.of(context).login,
            onTap: () {
              Get.to(()=> LoginScreen());
              // context.go(AppRouteConstants.login);
            },
          ),
        ],
      ),
    );
  }
}
