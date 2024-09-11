import 'package:darlemploi/Data/repositories/api_service.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/Model/get_all_job_model.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/components/success_job_dialog.dart';
import 'package:darlemploi/config/app_constant.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
   List<GetAllJobModel> _allJobs = [];
  List<GetAllJobModel> get  allJobs =>  _allJobs;
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
        _allJobs.add(GetAllJobModel.fromJson(response.data));
        print("this is all jobs ${response.data}");
        notifyListeners();
      }else{
        print("in else ${response.data}");
      }
    }catch(error){
      print("error ");
    }
  }
  bool applyJobLoading = false;
  void loadingApplyJob({required bool load}){
    applyJobLoading = load;
    notifyListeners();
  }
  int currentIndex = -1;
  void setIndex({required int index}){
    currentIndex = index;
    notifyListeners();
  }
  Future<void> applyForAJob({required String jobID,required BuildContext context})async{
    loadingApplyJob(load: true);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    print(formattedDate);
    Map<String , dynamic> body = {
      "action": "apply_for_job",
      "user_id":int.parse(AppConstant.getUserID),
      "job_id":int.parse(jobID),
      "application_date":formattedDate,
      "status":"pending"
    };
    try{
      Response response = await _apiService.getAllJobs(params: body);
      if(response.statusCode == 200){
        loadingApplyJob(load: false);
        _showConfirmationDialog(context);
        print("this is all jobs ${response.data}");
        notifyListeners();
      }else{
        loadingApplyJob(load: false);
        print("in else ${response.data}");
      }
    }catch(error){
      loadingApplyJob(load: false);
      print("error ");
    }
  }
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return const SuccessJobDialog();
      },
    );
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
