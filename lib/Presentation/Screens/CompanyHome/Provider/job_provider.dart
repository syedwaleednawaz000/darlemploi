import 'package:darlemploi/Presentation/Screens/CompanyHome/companay_home_screen.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CreateJobProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();


  bool _loading = false;
  bool get loading => _loading;

  void changeLoadingStatus({required bool load}) {
    _loading = load;
    notifyListeners();
  }
  Future<void> createJob({required String education}) async {
    changeLoadingStatus(load: true);
    Map<String, dynamic> body = {
      "action": AppUrl.registerUser,
      "title": "MEAN Stack",
      "description": "Description",
      "job_start_date": "2024-01-10",
      "duration": 10,
      "salary": 100000,
      "salary_time": 1,
      "recruiter_id": 1,
      "publication_date": "2024-01-10",
      "location": 1
    };
    try {
      Response response = await _apiService.createJob(params: body);
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
    super.dispose();
  }


}
