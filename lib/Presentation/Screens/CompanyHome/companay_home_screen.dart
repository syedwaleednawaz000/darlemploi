import 'package:darlemploi/Presentation/Screens/Auth/LogIn/View/login_screen.dart';
import 'package:darlemploi/Presentation/Screens/CompanyHome/Component/drawer_for_company.dart';
import 'package:darlemploi/Presentation/Screens/CompanyHome/Provider/job_provider.dart';
import 'package:darlemploi/config/app_constant.dart';
import 'package:darlemploi/config/app_url.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../config/app_router_constants.dart';
import '../../Widget/custom_bg.dart';
import '../../Widget/custom_text-field.dart';
import '../../Widget/my_button.dart';

class CompanyHomeScreen extends StatefulWidget {


  const CompanyHomeScreen({super.key});

  @override
  _CompanyHomeScreenState createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController numberOfPeopleController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController salaryTimeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController jobDescriptionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Color _appBarColor = Colors.transparent;
  final TextEditingController _dateController = TextEditingController();
  String _selectedDate = '2024-04-20'; // Default date format

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          _appBarColor = Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4);
        });
      } else {
        setState(() {
          _appBarColor = Colors.transparent;
        });
      }
    });
    _dateController.text = _selectedDate;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _dateController.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      final String formattedDate = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() {
        _selectedDate = formattedDate;
        _dateController.text = _selectedDate;
      });
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero, // Remove default padding
          content: Container(
            height: 250, // Set the fixed height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  String.fromCharCode(Icons.check_rounded.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.green,
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                    fontFamily: Icons.check_rounded.fontFamily,
                    package: Icons.check_rounded.fontPackage,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).yourOfferPublish,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: CustomBackGround(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                leading:  SizedBox(
                  child: GestureDetector(
                    onTap: (){
                      Get.offAll(()=> LoginScreen());
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   if (_scaffoldKey.currentState != null) {
                      //     _scaffoldKey.currentState!.openDrawer();
                      //   }
                      // });
                    },
                      child: Icon(Icons.menu_rounded, color: Colors.white)),
                ),
                backgroundColor: _appBarColor,
                title: Image.asset('assets/Images/name_logo.png', height: 70, width: 170),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Use SliverToBoxAdapter to add non-sliver widgets
              SliverToBoxAdapter(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppTranslations.of(context).publishOfferFree,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 32
                        )),
                    CustomTextField(
                      textAlign: TextAlign.start,
                      hintText: 'Animation M/W',
                      titleText: AppTranslations.of(context).jobTitle,
                      controller: jobTitleController,
                      validator: (newValue){
                        if(newValue!.isEmpty){
                          return "Job title cant be empty";
                        }else if(newValue.length< 5){
                          return "title must greater then 5 char";
                        }
                        return null;
                      },
                    ),
                  CustomTextField(
                    keyboardType: TextInputType.number, // Ensure numeric input
                    controller: numberOfPeopleController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow digits only
                      LengthLimitingTextInputFormatter(3), // Limit to 3 digits
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Number of people cannot be empty'; // Check if the field is empty
                      }
                      if (int.tryParse(value) == null || int.parse(value) <= 0) {
                        return 'Enter a valid number of people'; // Ensure it's a valid positive number
                      }
                      return null;
                    },
                    textAlign: TextAlign.start,
                    titleText: AppTranslations.of(context).numberOfPeople,
                    hintText: '10', // Example placeholder text
                  ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            keyboardType: TextInputType.number, // to ensure only numbers are entered
                            controller: salaryController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // allow only digits
                              LengthLimitingTextInputFormatter(7), // limit the input to 7 digits (adjust as needed)
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Salary cannot be empty'; // check if field is empty
                              }
                              if (int.tryParse(value) == null || int.parse(value) <= 0) {
                                return 'Enter a valid salary amount'; // ensure it's a valid positive number
                              }
                              return null;
                            },
                            textAlign: TextAlign.start,
                            titleText: AppTranslations.of(context).salary,
                            hintText: '10', // example placeholder
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: salaryTimeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[1-3]')), // only allow digits 1, 2, or 3
                              LengthLimitingTextInputFormatter(1), // limit input to 1 digit
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Salary time cannot be empty';
                              }
                              if (!['1', '2', '3'].contains(value)) {
                                return 'Salary time must be 1, 2, or 3';
                              }
                              return null;
                            },
                            textAlign: TextAlign.start,
                            titleText: 'Salary time',
                            hintText: AppTranslations.of(context).day,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            controller: _dateController,
                            validator: (newValue){
                              if(newValue!.isEmpty){
                                return "Start date cant be empty";
                              }
                              return null;
                            },
                            onTap: _selectDate,
                            textAlign: TextAlign.start,
                            titleText: AppTranslations.of(context).start,
                            hintText: _selectedDate,
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            keyboardType: TextInputType.number, // Use numeric keyboard
                            controller: durationController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Duration cannot be empty'; // Check if the field is empty
                              }
                              final number = int.tryParse(value); // Try to parse the value as an integer
                              if (number == null || number <= 2) {
                                return 'Enter a number greater than 2'; // Ensure the number is greater than 2
                              }
                              return null;
                            },
                            textAlign: TextAlign.start,
                            titleText: AppTranslations.of(context).duration,
                            hintText: '> 2', // Example placeholder text
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(AppTranslations.of(context).jobDescriptionOptional, style: TextStyle(color: Theme
                            .of(context)
                            .hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        maxLines: 6,
                        style: const TextStyle(color: Colors.white),
                        validator: (newValue){
                          if(newValue!.isEmpty){
                            return "Description cant be empty";
                          }
                          return null;
                        },
                        controller: jobDescriptionController,
                        decoration: InputDecoration(
                          contentPadding:  const EdgeInsets.only(left:  20,top:  30,right: 20,bottom: 10),
                          hintText: AppTranslations.of(context).wordsMaximum,
                          hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Consumer<CreateJobProvider>(builder: (context, createJobProvider, child) {
                        return MyButton(
                          title: AppTranslations.of(context).publish,
                          onTap: () {
                            if(_formKey.currentState!.validate()){

                              createJobProvider.createJob(
                                  body: {
                                    "action": AppUrl.createJob,
                                    "title": jobTitleController.text.trim(),
                                    "description": jobDescriptionController.text.trim(),
                                    "job_start_date": _dateController.text.trim(),
                                    "duration": int.parse(durationController.text.trim()),
                                    "salary": int.parse(salaryController.text.trim()),
                                    "salary_time": int.parse(salaryTimeController.text.trim()),
                                    "recruiter_id": int.parse(AppConstant.getUserID),
                                    "publication_date": _dateController.text.trim(),
                                    "location": 1
                                  }
                              );
                            }
                            // _showConfirmationDialog(context);
                          },
                          width: 120,
                        );
                      },),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
