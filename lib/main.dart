import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Forgot/Provider/forgot_provider.dart';
import 'package:darlemploi/Presentation/Screens/Auth/LogIn/Provider/login_provider.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Registraion/Provider/registration_provider.dart';
import 'package:darlemploi/Presentation/Screens/NotificationHelper/notification_helper.dart';
import 'package:darlemploi/Presentation/Screens/SplashScreen/Provider/splash_provider.dart';
import 'package:darlemploi/Presentation/Screens/SplashScreen/View/splash_screen.dart';
import 'package:darlemploi/Presentation/Screens/WellcomeScreen/welcome_provider.dart';
import 'package:darlemploi/Presentation/Stripe/stripe_provider.dart';
import 'package:darlemploi/Presentation/Theme/Provider/theme_provider.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Language/app_trans_delegat.dart';
import 'Language/language_provider.dart';
import 'Presentation/Screens/UserHomeScreen/provider/home_provider.dart';
import 'Presentation/routes/app_route_configs.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  // await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  // await FireBaseApi().initNotification();
  if(Platform.isAndroid){
    Stripe.publishableKey =
        AppUrl.stripePublishableKey;
  }else if(Platform.isIOS){

  }else{

  }
  final notificationHelper = NotificationHelper();
  await notificationHelper.initialize();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  // final String? locale;

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => StripeProvider()),
        ChangeNotifierProvider(create: (_) => WelcomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => ForgotProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        final languageProvider = Provider.of<LanguageProvider>(context);
        return Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            themeProvider.initializeTheme();
            // languageProvider.loadLocalLanguageCode();
            return ScreenUtilInit(
              designSize: const Size(393, 852),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                final themeProvider = Provider.of<ThemeProvider>(context);
                return GetMaterialApp(
                  // routeInformationProvider: AppRouter.router.routeInformationProvider,
                  // routeInformationParser: AppRouter.router.routeInformationParser,
                  // routerDelegate: AppRouter.router.routerDelegate,
                  // navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Dar Lemploi',
                  theme: themeProvider.getTheme(),
                  locale: languageProvider.selectedLanguage,
                  supportedLocales: languageProvider.supportedLanguages,
                  localizationsDelegates: [
                    AppTranslationsDelegate(languageProvider.selectedLanguage),
                    ...GlobalMaterialLocalizations.delegates,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  home: const SplashScreen(),
                );
              },
            );
          },
        );
      }),
    );
  }
}


