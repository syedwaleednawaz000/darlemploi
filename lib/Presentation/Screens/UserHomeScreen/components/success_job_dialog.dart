import 'package:darlemploi/Language/app_translation.dart';
import 'package:flutter/material.dart';

class SuccessJobDialog extends StatelessWidget {
  const SuccessJobDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
