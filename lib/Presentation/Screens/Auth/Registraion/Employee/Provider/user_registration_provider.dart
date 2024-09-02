import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:get/route_manager.dart';

class UserRegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingStatus({required bool load}) {
    _loading = load;
    notifyListeners();
  }
  Future<void> registerUser({ String? education}) async {
    changeLoadingStatus(load: true);
    Map<String, dynamic> body = {
      "action": AppUrl.registerUser,
      "user_name": fullNameController.text.trim(),
      "password": confirmPasswordController.text.trim(),
      "email": emailController.text.trim(),
      "type": "recruiter",
      "phone_number": phoneNumberController.text.trim(),
      "date_of_birth": "2002-01-01",
      "profile": "https://lambda-layers-bucket-malik.s3.amazonaws.com/CVs/CV-NINI.pdf",
      "list_of_location_ids": [1, 2]
    };
    try {
      Response response = await _apiService.registerUser(params: body);
      if (response.statusCode == 200) {
        changeLoadingStatus(load: false);
        print("Response: ${response.data}");
        Get.offAll(()=> const UserHomeScreen());
      } else {
        changeLoadingStatus(load: false);
        print("Response: ${response.data}");
      }
    } catch (error) {
      changeLoadingStatus(load: false);
      print("Error: ${error.toString()}");
    }
  }


  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
