import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:provider/provider.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/provider/home_provider.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_router_constants.dart';
import '../../Widget/custom_bg.dart';
import '../../Widget/custom_drop_down_textFeild.dart';
import '../../Widget/my_button.dart';
import 'components/home_card.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  Color _appBarColor = Colors.transparent;

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
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.push(AppRouteConstants.selectionScreen);
        return true;
      },
      child: CustomBackGround(
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                leading: SizedBox(
                  child: CustomPopup(
                    showArrow: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    barrierColor: Colors.indigo.withOpacity(0.4),
                    arrowColor: Colors.white,
                    contentDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    content: SizedBox(
                      height: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<HomeProvider>(
                            builder: (context, provider, child) {
                              return DropDownTextField(
                                hint: provider.selectedCity,
                                titleText: AppTranslations.of(context).cityDepartmentRegion,
                                suffixIcon: DropdownButton<String>(
                                  underline: const SizedBox.shrink(),
                                  // value: provider.selectedCity,
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      provider.setCity(newValue);
                                    }
                                  },
                                  hint: Text(AppTranslations.of(context).select),
                                ),
                              );
                            },
                          ),
                          Consumer<HomeProvider>(
                            builder: (context, provider, child) {
                              return DropDownTextField(
                                hint: provider.selectedDuration,
                                titleText: AppTranslations.of(context).duration,
                                suffixIcon: DropdownButton<String>(
                                  underline: const SizedBox.shrink(),
                                  // value: provider.selectedDuration,
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      provider.setDuration(newValue);
                                    }
                                  },
                                  hint:  Text(AppTranslations.of(context).select),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<HomeProvider>(
                                  builder: (context, provider, child) {
                                    return  DropDownTextField(
                                      hint: '2000 DZD',
                                      readOnly: false,
                                      titleText: AppTranslations.of(context).minimumSalary,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Consumer<HomeProvider>(
                                  builder: (context, provider, child) {
                                    return DropDownTextField(
                                      hint: provider.selectedDay,
                                      titleText: '     ',
                                      suffixIcon: DropdownButton<String>(
                                        underline: const SizedBox.shrink(),
                                        // value: provider.selectedDay,
                                        items: <String>[
                                          'Day',
                                          'Week',
                                          'Month',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          if (newValue != null) {
                                            provider.setDay(newValue);
                                          }
                                        },
                                        hint:  Text(AppTranslations.of(context).done),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Consumer<HomeProvider>(
                            builder: (context, provider, child) {
                              return DropDownTextField(
                                hint: provider.selectedSector,
                                titleText: AppTranslations.of(context).events,
                                suffixIcon: DropdownButton<String>(
                                  underline: const SizedBox.shrink(),
                                  // value: provider.selectedSector,
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      provider.setSector(newValue);
                                    }
                                  },
                                  hint:  Text(AppTranslations.of(context).select),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: MyButton(
                              title: AppTranslations.of(context).done,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              width: 100,
                              btnColor: Theme.of(context).scaffoldBackgroundColor,
                              txtColor: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
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
                        'K',
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => HomeCardWidget(onButtonTap: () {}),
                    childCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
