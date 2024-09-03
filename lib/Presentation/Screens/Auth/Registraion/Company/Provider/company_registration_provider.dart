import 'package:darlemploi/Presentation/Screens/CompanyHome/companay_home_screen.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CompanyRegistrationProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyEmailController = TextEditingController();
  final TextEditingController companyPhoneNumberController = TextEditingController();
  final TextEditingController companyPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController companyDateOfCreationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingStatus({required bool load}) {
    _loading = load;
    notifyListeners();
  }
  Future<void> registerCompany({required String education}) async {
    changeLoadingStatus(load: true);
    Map<String, dynamic> body = {
      "action": AppUrl.registerUser,
      "user_name": "${companyNameController.text.trim()}",
      "password": "${confirmPasswordController.text.trim()}",
      "email": companyEmailController.text.trim(),
      "type": "recruiter",
      "phone_number": companyPhoneNumberController.text.trim(),
      "date_of_birth": companyDateOfCreationController.text.trim(),
      "profile": "https://lambda-layers-bucket-malik.s3.amazonaws.com/CVs/CV-NINI.pdf",
      "list_of_location_ids": [1, 2]
    };
    try {
      Response response = await _apiService.registerUser(params: body);
      if (response.statusCode == 200) {
        changeLoadingStatus(load: false);
        print("Response: ${response.data}");
        Get.offAll(()=> const CompanyHomeScreen());
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
    // Dispose only the necessary controllers
    companyNameController.dispose();
    companyEmailController.dispose();
    companyPhoneNumberController.dispose();
    companyPasswordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();

    super.dispose();
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
      companyDateOfCreationController.text = formattedDate; // Set the formatted date to the controller
    }
  }
}
