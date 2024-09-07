import 'dart:convert';

import 'package:darlemploi/Presentation/Screens/CompanyHome/companay_home_screen.dart';
import 'package:darlemploi/config/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingStatus({required bool load}) {
    _loading = load;
    notifyListeners();
  }

  Future<void> login({required Map<String, dynamic> params}) async {
    changeLoadingStatus(load: true);
    try {
      Response response = await _apiService.registerUser(params: params);
      if (response.statusCode == 200) {
        changeLoadingStatus(load: false);
        storeUserLocalData(userData: response.data['data']['user']);
        if(response.data['data']['user']['type'] == "employee"){
          Get.offAll(() => const UserHomeScreen());
        }else if( response.data['data']['user']['type'] =="recruiter"){
          Get.offAll(() => const CompanyHomeScreen());
        }
        notifyListeners();
      } else {
        changeLoadingStatus(load: false);
      }
    } catch (error) {
      changeLoadingStatus(load: false);
    }
  }


  void storeUserLocalData({required Map<String, dynamic> userData}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert the userData Map to a JSON string before storing it
    prefs.setString(AppConstant.saveUserdata, jsonEncode(userData));
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
