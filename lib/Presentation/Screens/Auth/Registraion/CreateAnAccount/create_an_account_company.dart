import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Language/app_translation.dart';
import '../../../../Widget/custom_bg.dart';
import '../../../CompanyHome/companay_home_screen.dart';
import '../Provider/registration_provider.dart';

class CompanyRegistrationTwoScreen extends StatefulWidget {
  const CompanyRegistrationTwoScreen({super.key});

  @override
  _CompanyRegistrationTwoScreenState createState() =>
      _CompanyRegistrationTwoScreenState();
}

class _CompanyRegistrationTwoScreenState
    extends State<CompanyRegistrationTwoScreen> {
  String? _selectedEvents;

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
              Image.asset('assets/Images/name_logo.png',
                  width: 400, height: 120),
              const SizedBox(height: 50),
              Text(
                AppTranslations.of(context).companyAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(height: 5),
              Consumer<RegistrationProvider>(
                builder: (context, registrationProvider, child) {
                  return TextFormField(
                    controller: registrationProvider.addressController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: -9),
                      hintText: 'N°186 B6 UV 5 Ali Mendjli El khroub',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                AppTranslations.of(context).city,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(height: 5),
              Consumer<RegistrationProvider>(
                builder: (context, registrationProvider, child) {
                  return TextFormField(
                    controller: registrationProvider.cityController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: -9),
                      hintText: 'Constantine',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                AppTranslations.of(context).postalCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(height: 5),
              Consumer<RegistrationProvider>(
                builder: (context, registrationProvider, child) {
                  return TextFormField(
                    controller: registrationProvider.postalCodeController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: -9),
                      hintText: '25000',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(55),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Text(
                '${AppTranslations.of(context).events}:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: _selectedEvents,
                style: TextStyle(color: Colors.white),
                dropdownColor: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
                icon: Icon(Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: AppTranslations.of(context).events,
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                  iconColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                items: <String>[
                  'Events 1',
                  'Events 2',
                  'Events 3',
                  'Events 4',
                  'Events 5',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedEvents = newValue;
                  });
                },
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
                          builder: (context) => const CompanyHomeScreen()),
                    );
                  },
                  title: AppTranslations.of(context).next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
