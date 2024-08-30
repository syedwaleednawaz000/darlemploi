import 'package:flutter/material.dart';

class DropDownTextField extends StatelessWidget {
  final String titleText;
  final String? hint;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;

  const DropDownTextField({
    Key? key,
    required this.titleText,
    this.hint,
    this.controller,
    this.value,
    this.onChanged,
    this.readOnly = true,
    this.contentPadding,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText, style: TextStyle(color: Theme
            .of(context)
            .scaffoldBackgroundColor,
            fontWeight: FontWeight.w500,
            fontSize: 16)),
        SizedBox(
          height: 40,
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,fontWeight: FontWeight.w300),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: -10),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: BorderSide(color: Theme
                    .of(context)
                    .scaffoldBackgroundColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: BorderSide(color: Theme
                    .of(context)
                    .scaffoldBackgroundColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(55),
                borderSide: BorderSide(color: Theme
                    .of(context)
                    .primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
