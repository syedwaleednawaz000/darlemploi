import 'package:darlemploi/Presentation/Screens/Auth/Registraion/Company/Provider/company_registration_provider.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:darlemploi/Utils/flutter_toast.dart';
import 'package:darlemploi/Utils/validator.dart';
import 'package:darlemploi/my_size/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../Language/app_translation.dart';
import '../../../../Widget/custom_bg.dart';
import '../../../CompanyHome/companay_home_screen.dart';


class CompanyRegistrationTwoScreen extends StatefulWidget {
  const CompanyRegistrationTwoScreen({super.key});

  @override
  _CompanyRegistrationTwoScreenState createState() =>
      _CompanyRegistrationTwoScreenState();
}

class _CompanyRegistrationTwoScreenState
    extends State<CompanyRegistrationTwoScreen> {
  String? _selectedEvents;
  final _formKey = GlobalKey<FormState>();
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
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Consumer<CompanyRegistrationProvider>(
                    builder: (context, registrationProvider, child) {
                      return TextFormField(
                        validator: Validation.validateAddress,
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Consumer<CompanyRegistrationProvider>(
                    builder: (context, registrationProvider, child) {
                      return TextFormField(
                        validator: Validation.validateAddress,
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Consumer<CompanyRegistrationProvider>(
                    builder: (context, registrationProvider, child) {
                      return TextFormField(
                        validator: Validation.validatePostalCode,
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
                      'BA',
                      'MA',
                      'BSC',
                      'BS',
                      'M-Phil',
                      'PHD',
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
                  SizedBox(height: MySize.size30,),
                  // const Spacer(),
                  Center(
                    child: Consumer<CompanyRegistrationProvider>(builder: (context, companyRegistrationProvider, child) {
                      return MyButton(
                        loading: companyRegistrationProvider.loading,
                        width: 140,
                        btnColor: Theme.of(context).primaryColor,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            if(_selectedEvents != null){
                              companyRegistrationProvider.registerCompany(education: _selectedEvents.toString());
                            }else{
                              ToastMessage.toastMessage(message: "Please select education",isError: true);
                            }
                          }

                        },
                        title: AppTranslations.of(context).next,
                      );
                    },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
