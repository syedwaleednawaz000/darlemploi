  import 'package:flutter/material.dart';

  class CustomTextField extends StatelessWidget {
    final TextEditingController? controller;
    final String hintText;
    final String titleText;
    final bool? readOnly;
    final TextAlign textAlign;
    final VoidCallback? onTap;
    final TextStyle? style;
    final EdgeInsetsGeometry? contentPadding;
    final bool obscureText;

    const CustomTextField({
      Key? key,
      this.controller,
      this.onTap,
      this.readOnly,
      required this.hintText,
      this.textAlign = TextAlign.center,
      this.style,
      required this.titleText,
      this.contentPadding,
      this.obscureText = false,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleText, style: TextStyle(color: Theme
                .of(context)
                .hintColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
            SizedBox(
              height: 40,
              child: TextFormField(
                onTap: onTap,
                controller: controller,
                textAlign: textAlign,
                readOnly: readOnly ?? false,
                style: style ?? const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16,vertical: -6),
                  hintText: hintText,
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
                obscureText: obscureText,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }
  }
