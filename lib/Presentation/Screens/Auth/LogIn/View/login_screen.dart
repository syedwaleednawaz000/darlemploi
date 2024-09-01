import 'package:darlemploi/Utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Screens/Auth/LogIn/Provider/login_provider.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:darlemploi/Utils/validator.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import 'package:provider/provider.dart';
import '../../../../Widget/custom_bg.dart';
import '../../../UserHomeScreen/user_home_screen.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.push(AppRouteConstants.selectionScreen);
        return true;
      },
      child: CustomBackGround(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Image.asset('assets/Images/name_logo.png', width: 400, height: 120),
                const SizedBox(height: 50),
                Text(
                  AppTranslations.of(context).identifier,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
                ),
                const SizedBox(height: 5),
                Consumer<LoginProvider>(
                  builder: (context, loginProvider, child) {
                    return TextFormField(
                      validator: Validation.validateUsername,
                      controller: loginProvider.userNameController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'kamran@123',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12.0),
                Text(
                  AppTranslations.of(context).password,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 24),
                ),
                const SizedBox(height: 5),
                Consumer<LoginProvider>(
                  builder: (context, loginProvider, child) {
                    return TextFormField(
                      validator: Validation.validatePassword,
                      controller: loginProvider.passwordController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: '**************',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(55),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24.0),
                Consumer<LoginProvider>(
                  builder: (context, loginProvider, child) {
                    return MyButton(
                      btnColor: Theme.of(context).hintColor,
                      loading: loginProvider.loading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          loginProvider.login(params: {
                            "action": AppUrl.loginUser,
                            "user_name": loginProvider.userNameController.text.trim(),
                            "password":loginProvider.passwordController.text.trim(),
                          });
                        }
                      },
                      title: AppTranslations.of(context).login,
                    );
                  },
                ),
                const SizedBox(height: 12.0),
                Text(
                  'or',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12.0),
                MyButton(
                  btnColor: Theme.of(context).hintColor,
                  onTap: () {
                    // context.go(AppRouteConstants.dashBoardScreen);
                  },
                  title: AppTranslations.of(context).connectVia,
                  image: Image.asset('assets/Images/google.png', height: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
