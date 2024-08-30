import 'dart:async';
import 'package:flutter/material.dart';
import 'package:darlemploi/Presentation/Screens/selectionScreen/selection_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/Presentation/routes/app_route_configs.dart';
import 'package:darlemploi/config/app_router_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter.getLocalData();
    Timer(const Duration(seconds: 2), () {
      // context.go('${AppRouter.currentScreen}');
      // context.push(AppRouteConstants.selectionScreen);
      Get.to(() => const SelectionScreen());
    });
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset('assets/Images/bg_logo.png')],
        ),
      ),
    );
  }
}
