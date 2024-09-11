import 'package:darlemploi/Presentation/Screens/UserHomeScreen/Model/get_all_job_model.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/components/success_job_dialog.dart';
import 'package:darlemploi/Presentation/Screens/UserHomeScreen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';
import 'package:provider/provider.dart';

class HomeCardWidget extends StatelessWidget {
  Jobs? jobs;
  int index ;
   HomeCardWidget({
    Key? key,
    this.jobs,
     required this.index,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobs!.title.toString() ?? AppTranslations.of(context).aRKAAgency,
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                Text(
                  jobs!.salary.toString() ?? '4000 DZD/${AppTranslations.of(context).day}',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  jobs!.jobStartDate ?? 'From 20 to 30 Jul',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              jobs!.description ?? '10 Animation M/W',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            jobs!.location.toString() ?? 'Hussein Day, Alger',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Consumer<UserHomeProvider>(
              builder: (context, userHomeProvider, child) {
                return MyButton(
                  loading: userHomeProvider.applyJobLoading ==true && userHomeProvider.currentIndex == index?true:false,
                  title: AppTranslations.of(context).apply,
                  onTap: () {
                    userHomeProvider.applyForAJob(jobID: jobs!.id.toString(), context: context);
                    // _showConfirmationDialog(context);
                  },
                  width: 120,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
