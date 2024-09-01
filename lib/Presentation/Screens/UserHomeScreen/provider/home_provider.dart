import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:darlemploi/config/app_constant.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserHomeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  // Controllers for text fields
  final TextEditingController cityController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  // Maps to hold selected values for each dropdown
  String _selectedCity = 'Option 1';
  String _selectedDuration = 'Option 1';
  String _selectedSalary = '2000 DZD';
  String _selectedSector = 'Option 1';
  String _selectedDay = 'Day';

  String get selectedCity => _selectedCity;
  String get selectedDuration => _selectedDuration;
  String get selectedSalary => _selectedSalary;
  String get selectedSector => _selectedSector;
  String get selectedDay => _selectedDay;

  void setCity(String value) {
    _selectedCity = value;
    cityController.text = value;
    notifyListeners();
  }

  void setDuration(String value) {
    _selectedDuration = value;
    durationController.text = value;
    notifyListeners();
  }

  void setSalary(String value) {
    _selectedSalary = value;
    salaryController.text = value;
    notifyListeners();
  }

  void setSector(String value) {
    _selectedSector = value;
    sectorController.text = value;
    notifyListeners();
  }

  void setDay(String value) {
    _selectedDay = value;
    dayController.text = value;
    notifyListeners();
  }

  Future<void> getAllJobs()async{
    Map<String , dynamic> body = {
      "action": AppUrl.getAllJobs,
      "apply_filters": {
        "page": 1,
        "limit": 10,
        "title": "",
        "description": "",
        "locations": [],
        "duration": 0,
        "min_salary": 0,
        "max_salary": 0,
        "salary_time": 0,
        "recruiter_id": "",
        "publication_date": ""
      }
    };
    try{
      Response response = await _apiService.getAllJobs(params: body);
      if(response.statusCode == 200){
        print("this is all jobs ${response.data}");
      }else{
        print("in else ${response.data}");
      }
    }catch(error){
      print("error ");
    }
  }
  @override
  void dispose() {
    cityController.dispose();
    durationController.dispose();
    salaryController.dispose();
    sectorController.dispose();
    dayController.dispose();
    super.dispose();
  }
}
