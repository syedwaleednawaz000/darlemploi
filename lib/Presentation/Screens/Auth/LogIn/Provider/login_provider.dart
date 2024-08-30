import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:get/route_manager.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        print(" response in else ${response.data}");
        Get.to(() => const UserHomeScreen());
        notifyListeners();
      } else {
        changeLoadingStatus(load: false);
        print(" response in else ${response.data}");
      }
    } catch (error) {
      changeLoadingStatus(load: false);
      print("this is error ${error.toString()}");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
