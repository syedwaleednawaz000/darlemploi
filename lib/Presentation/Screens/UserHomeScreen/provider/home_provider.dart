import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
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
