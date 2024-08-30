import 'package:flutter/material.dart';
import 'package:darlemploi/Language/app_translation.dart';
import 'package:darlemploi/Presentation/Widget/my_button.dart';

class HomeCardWidget extends StatelessWidget {
  final String? title;
  final String? dailyRate;
  final String? dateRange;
  final String? description;
  final String? location;
  final VoidCallback onButtonTap;

  const HomeCardWidget({
    Key? key,
    this.title,
    this.dailyRate,
    this.dateRange,
    this.description,
    this.location,
    required this.onButtonTap,
  }) : super(key: key);

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
              border: Border.all(color: Colors.indigo,width: 2)
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
                  AppTranslations.of(context).yourApplicationSent,
                  style: const TextStyle(
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
            title ?? AppTranslations.of(context).aRKAAgency,
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
                  dailyRate ?? '4000 DZD/${AppTranslations.of(context).day}',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  dateRange ?? 'From 20 to 30 Jul',
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
              description ?? '10 Animation M/W',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            location ?? 'Hussein Day, Alger',
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: MyButton(
              title: AppTranslations.of(context).apply,
              onTap: () {
                _showConfirmationDialog(context);
              },
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
