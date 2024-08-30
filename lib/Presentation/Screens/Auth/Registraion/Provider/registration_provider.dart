import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';

class RegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController companyPhoneNumberController = TextEditingController();
  final TextEditingController companyPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController companyPasswordConfirmation = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();


  Future<void> registrationUser({required Map<String, dynamic> params}) async {
    try {
      Response response = await _apiService.registerUser(params: params);
      if (response.statusCode == 200) {
        print("Response: ${response.data}");
      } else {
        print("Response: ${response.data}");
      }
    } catch (error) {
      print("Error: ${error.toString()}");
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    companyNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
