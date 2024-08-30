import 'package:flutter/material.dart';
import 'AllLanguageTranslation/arabic.dart';
import 'AllLanguageTranslation/english.dart';
import 'AllLanguageTranslation/korean.dart';
import 'AllLanguageTranslation/spanish.dart';
import 'AllLanguageTranslation/urdu.dart';

class AppTranslations {
  final Locale locale;

  AppTranslations(this.locale);

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations)!;
  }

  static  final Map<String, Map<String, String>> _translations = {
    'en': English.english,
    'es': Spanish.spanish,
    'ur': Urdu.urdu,
    'ar': Arabic.arabic,
    'ko': Korean.korean,
  };

  String get identifier => _translations[locale.languageCode]?['Identifier'] ?? '';
  String get login => _translations[locale.languageCode]?['Login'] ?? '';
  String get password => _translations[locale.languageCode]?['Password'] ?? '';
  String get connectVia => _translations[locale.languageCode]?['ConnectVia'] ?? '';
  String get postalCode => _translations[locale.languageCode]?['PostalCode'] ?? '';
  String get companyAddress => _translations[locale.languageCode]?['CompanyAddress'] ?? '';
  String get next => _translations[locale.languageCode]?['Next'] ?? '';
  String get events => _translations[locale.languageCode]?['Events'] ?? '';
  String get city => _translations[locale.languageCode]?['City'] ?? '';
  String get address => _translations[locale.languageCode]?['Address'] ?? '';
  String get education => _translations[locale.languageCode]?['Education'] ?? '';
  String get selectEducation => _translations[locale.languageCode]?['SelectEducation'] ?? '';
  String get chooseFile => _translations[locale.languageCode]?['ChooseFile'] ?? '';
  String get cv => _translations[locale.languageCode]?['CV'] ?? '';
  String get createYourAccount => _translations[locale.languageCode]?['CreateYourAccount'] ?? '';
  String get passwordConfirmation => _translations[locale.languageCode]?['PasswordConfirmation'] ?? '';
  String get phoneNumber => _translations[locale.languageCode]?['PhoneNumber'] ?? '';
  String get email => _translations[locale.languageCode]?['Email'] ?? '';
  String get aRKAAgency => _translations[locale.languageCode]?['ARKAAgency'] ?? '';
  String get companyName => _translations[locale.languageCode]?['CompanyName'] ?? '';
  String get fullName => _translations[locale.languageCode]?['FullName'] ?? '';
  String get publish => _translations[locale.languageCode]?['Publish'] ?? '';
  String get wordsMaximum => _translations[locale.languageCode]?['WordsMaximum'] ?? '';
  String get jobDescriptionOptional => _translations[locale.languageCode]?['JobDescriptionOptional'] ?? '';
  String get duration => _translations[locale.languageCode]?['Duration'] ?? '';
  String get start => _translations[locale.languageCode]?['Start'] ?? '';
  String get day => _translations[locale.languageCode]?['Day'] ?? '';
  String get salary => _translations[locale.languageCode]?['Salary'] ?? '';
  String get numberOfPeople => _translations[locale.languageCode]?['NumberOfPeople'] ?? '';
  String get jobTitle => _translations[locale.languageCode]?['JobTitle'] ?? '';
  String get publishOfferFree => _translations[locale.languageCode]?['PublishOfferFree'] ?? '';
  String get yourOfferPublish => _translations[locale.languageCode]?['YourOfferPublish'] ?? '';
  String get iAmCompany => _translations[locale.languageCode]?['IAmCompany'] ?? '';
  String get iAmCandidate => _translations[locale.languageCode]?['IAmCandidate'] ?? '';
  String get whatYourChoice => _translations[locale.languageCode]?['WhatYourChoice'] ?? '';
  String get done => _translations[locale.languageCode]?['Done'] ?? '';
  String get minimumSalary => _translations[locale.languageCode]?['MinimumSalary'] ?? '';
  String get select => _translations[locale.languageCode]?['Select'] ?? '';
  String get cityDepartmentRegion => _translations[locale.languageCode]?['CityDepartmentRegion'] ?? '';
  String get apply => _translations[locale.languageCode]?['Apply'] ?? '';
  String get welcomeTo => _translations[locale.languageCode]?['WelcomeTo'] ?? '';
  String get getYourselfJob => _translations[locale.languageCode]?['GetYourselfJob'] ?? '';
  String get createAnAccount => _translations[locale.languageCode]?['CreateAnAccount'] ?? '';
  String get yourApplicationSent => _translations[locale.languageCode]?['YourApplicationSent'] ?? '';

}