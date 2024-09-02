import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Registraion/Company/registration_screen_company.dart';
import 'package:darlemploi/Presentation/Screens/Auth/Registraion/Employee/registration_screen_user.dart';
import 'package:darlemploi/Presentation/Screens/WellcomeScreen/well_come_screen.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenProvider extends ChangeNotifier{
  String _userType = '';
  void handleCreateAccount({required BuildContext context,}) async {
    if (kDebugMode) {
      if (kDebugMode) {
        print("this is new user type $_userType");
      }
    }
    if(_userType =="recruiter"){
      Get.to(()=> CompanyRegistrationScreen());
    }else if(_userType =="employee"){
      Get.to(()=> UserRegistrationScreen());
    }
    notifyListeners();
  }

  Future<void> saveUserType({required String userType,required BuildContext context}) async {
    _userType = userType;
    Get.to(()=>const WellComeScreen());
    notifyListeners();
    }

}