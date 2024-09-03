import 'package:darlemploi/Presentation/Screens/Auth/LogIn/View/login_screen.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/user_home_screen.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class UserRegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingStatus({required bool load}) {
    _loading = load;
    notifyListeners();
  }
  String formatPhoneNumber(String phoneNumber) {
    // Remove any leading zeros
    phoneNumber = phoneNumber.replaceFirst(RegExp(r'^0+'), '');

    // Ensure the phone number only contains digits
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Add '+' at the start
    phoneNumber = '+' + phoneNumber;

    // Format the phone number into groups of three with dashes
    final formattedPhoneNumber = phoneNumber.replaceAllMapped(
      RegExp(r'(\d{3})(\d{3})(\d{4})'),
          (Match match) => '${match[1]}-${match[2]}-${match[3]}',
    );

    return formattedPhoneNumber;
  }
  Future<void> registerUser({ String? education}) async {
    changeLoadingStatus(load: true);
    Map<String, dynamic> body = {
      "action": AppUrl.registerUser,
      "user_name": fullNameController.text.trim(),
      "password": confirmPasswordController.text.trim(),
      "email": emailController.text.trim(),
      "type": "employee",
      "phone_number": phoneNumberController.text.trim(),
      "date_of_birth": dobController.text.trim(),
      "profile": "https://lambda-layers-bucket-malik.s3.amazonaws.com/CVs/CV-NINI.pdf",
      "list_of_location_ids": [1, 2]
    };
    try {
      Response response = await _apiService.registerUser(params: body);
      if (response.statusCode == 200) {
        changeLoadingStatus(load: false);
        print("Response: ${response.data}");
        Get.offAll(()=>  LoginScreen());
      } else {
        changeLoadingStatus(load: false);
        print("Response: ${response.data}");
      }
    } catch (error) {
      changeLoadingStatus(load: false);
      print("Error: ${error.toString()}");
    }
  }

  Future<void> pickDate({required BuildContext context})async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), // Minimum date
      lastDate: DateTime(23000), // Maximum date
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      print("date time  ${formattedDate}");
      dobController.text = formattedDate; // Set the formatted date to the controller
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
    dobController.dispose();

    super.dispose();
  }
}
