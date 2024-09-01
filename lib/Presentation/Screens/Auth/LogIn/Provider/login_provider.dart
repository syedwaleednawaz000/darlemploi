import 'package:darlemploi/Presentation/Screens/CompanyHome/companay_home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:get/route_manager.dart';

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

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
