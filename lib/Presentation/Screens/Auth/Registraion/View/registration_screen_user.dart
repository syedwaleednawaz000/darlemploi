import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import '../../../../Widget/custom_bg.dart';
import '../CreateAnAccount/create_an_account_user.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false; // Prevent the default behavior
      },
      child: CustomBackGround(
          body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.asset('assets/Images/name_logo.png', width: 400, height: 120),
            const SizedBox(height: 50),
            Text(AppTranslations.of(context).fullName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                hintText: 'Kaddour Boumedous',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white),
                // labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const SizedBox(height: 12.0),
            Text('${AppTranslations.of(context).email}:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                hintText: 'Kaddour-Boumedous@gmail.com',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white),
                // labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(AppTranslations.of(context).phoneNumber,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                hintText: '07792388463',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white),
                // labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(AppTranslations.of(context).password,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                hintText: '**************',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white),
                // labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(AppTranslations.of(context).passwordConfirmation,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 19)),
            const SizedBox(height: 5),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                hintText: '**************',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white),
                // labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const Spacer(),
            Center(
              child: MyButton(
                width: 140,
                btnColor: Theme.of(context).primaryColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationTwoScreen(),
                      ));
                },
                title: AppTranslations.of(context).next,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
