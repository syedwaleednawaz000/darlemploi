import 'package:darlemploi/Presentation/Screens/Auth/Registraion/Employee/Provider/user_registration_provider.dart';
import 'package:darlemploi/Utils/validator.dart';
import 'package:darlemploi/my_size/my_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import '../../../../Widget/custom_bg.dart';
import 'create_an_account_user.dart';

class UserRegistrationScreen extends StatelessWidget {
   UserRegistrationScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<UserRegistrationProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false; // Prevent the default behavior
      },
      child: CustomBackGround(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Image.asset('assets/Images/name_logo.png', width: 400, height: 120),
                  const SizedBox(height: 50),
                  Text(
                    AppTranslations.of(context).fullName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: Validation.validateName,
                    controller: registrationProvider.fullNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                      hintText: 'Kaddour Boumedous',
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
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    '${AppTranslations.of(context).email}:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: Validation.validateEmail,
                    controller: registrationProvider.emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                      hintText: 'Kaddour-Boumedous@gmail.com',
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
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppTranslations.of(context).phoneNumber,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: Validation.validatePhoneNumber,
                    controller: registrationProvider.phoneNumberController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                      hintText: '07792388463',
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
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppTranslations.of(context).password,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: Validation.validatePassword,
                    controller: registrationProvider.passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -9),
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
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppTranslations.of(context).passwordConfirmation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    validator: Validation.validatePassword,
                    controller: registrationProvider.confirmPasswordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: -9),
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
                  ),
                ],
              ),
            ),
          ),
        ),
        bottom:                 Container(
          height:  MySize.size64,
          child: Consumer<UserRegistrationProvider>(builder: (context, userRegistrationProvider, child) {
            return MyButton(
              width: 140,
              btnColor: Theme.of(context).primaryColor,
              onTap: () {
                if(_formKey.currentState!.validate()){
                  // userRegistrationProvider.registrationUser(params: params);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserRegistrationTwoScreen(),
                    ),
                  );
                }
              },
              title: AppTranslations.of(context).next,
            );
          },),
        ),
      ),
    );
  }
}
