import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:go_router/go_router.dart';
import 'package:darlemploi/config/app_router_constants.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../Widget/custom_bg.dart';
import '../../../UserHomeScreen/user_home_screen.dart';

class RegistrationTwoScreen extends StatefulWidget {
  const RegistrationTwoScreen({super.key});

  @override
  _RegistrationTwoScreenState createState() => _RegistrationTwoScreenState();
}

class _RegistrationTwoScreenState extends State<RegistrationTwoScreen> {
  String? _selectedEducation;
  String? _pickedFile;

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _pickedFile = result.files.single.name;
      });
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false; // Prevent the default behavior
      },
      child: CustomBackGround(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/Images/name_logo.png', width: 400, height: 120),
              Text(
                AppTranslations.of(context).address,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _addressController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                  hintText: 'N°186 B6 UV 5 Ali Mendjli El khroub',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                AppTranslations.of(context).city,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _cityController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                  hintText: 'Constantine',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                AppTranslations.of(context).postalCode,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _postalCodeController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: -9),
                  hintText: '25000',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                AppTranslations.of(context).education,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: _selectedEducation,
                style: const TextStyle(color: Colors.white),
                dropdownColor: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
                icon: Icon(Icons.arrow_drop_down_rounded, color: Theme.of(context).primaryColor),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: AppTranslations.of(context).selectEducation,
                  hintStyle: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                  iconColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(55),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                items: <String>[
                  'BSc CS',
                  'BS Software',
                  'BSc IT',
                  'BSc Mathematics',
                  'BSc Physics',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedEducation = newValue;
                  });
                },
              ),
              const SizedBox(height: 12.0),
              Center(
                child: Text(
                  AppTranslations.of(context).cv,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 34),
                ),
              ),
              Center(
                child: MyButton(
                  width: 140,
                  btnColor: Theme.of(context).cardColor,
                  onTap: _pickFile,
                  title: AppTranslations.of(context).chooseFile,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: _pickFile,
                  child: const Icon(Icons.file_upload_outlined, color: Colors.white, size: 44),
                ),
              ),
              if (_pickedFile != null)
                Center(
                  child: Text(
                    'File chosen: $_pickedFile',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              const Spacer(),
              Center(
                child: MyButton(
                  width: 140,
                  btnColor: Theme.of(context).primaryColor,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UserHomeScreen()));
                    // context.go(AppRouteConstants.dashBoardScreen);
                  },
                  title: AppTranslations.of(context).createYourAccount,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
