import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:darlemploi/Language/app_translation.dart';
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
    Future.microtask(() => Provider.of<UserHomeProvider>(context,listen: false).getAllJobs());
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<UserHomeProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        context.push(AppRouteConstants.selectionScreen);
        return true;
      },
      child: CustomBackGround(
        key: _scaffoldKey,
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
                          DropDownTextField(
                            hint: homeProvider.selectedCity,
                            titleText: AppTranslations.of(context).cityDepartmentRegion,
                            suffixIcon: DropdownButton<String>(
                              underline: const SizedBox.shrink(),
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
                                  homeProvider.setCity(newValue);
                                }
                              },
                              hint: Text(AppTranslations.of(context).select),
                            ),
                          ),
                          // Other DropDownTextField and widgets...
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
                sliver: Consumer<UserHomeProvider>(
                  builder: (context, userHomeProvider, child) {
                    // If jobs are available
                    if (userHomeProvider.allJobs.isNotEmpty) {
                      if (userHomeProvider.allJobs[0].data != null) {
                        if (userHomeProvider.allJobs[0].data!.jobs != null){
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) => GestureDetector(
                                    onTap: (){
                                      userHomeProvider.setIndex(index: index);
                                    },
                                    child: HomeCardWidget(
                                      jobs: userHomeProvider.allJobs[0].data!.jobs![index],
                                      index: index,
                                    ),
                                  ),
                              childCount: userHomeProvider.allJobs[0].data!.jobs!.length,
                            ),
                          );
                        }else{
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                "Jobs are not available",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );

                        }
                      } else {
                        // Show a "Jobs are not available" message
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: Text(
                              "Jobs are not available",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    } else {
                      // Show a loading spinner while data is being fetched
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}