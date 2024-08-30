import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
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
    notifyListeners();
  }

  void setDuration(String value) {
    _selectedDuration = value;
    notifyListeners();
  }

  void setSalary(String value) {
    _selectedSalary = value;
    notifyListeners();
  }

  void setSector(String value) {
    _selectedSector = value;
    notifyListeners();
  }

  void setDay(String value) {
    _selectedDay = value;
    notifyListeners();
  }
}
