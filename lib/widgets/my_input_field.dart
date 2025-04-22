// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:real_estate/textstyles/text_colors.dart';

class MyInputField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final bool? isObsecure;
  const MyInputField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.isObsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: isObsecure ?? false,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            prefixIcon,
            color: primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColorInactive, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryColor, width: 4),
          ),
        ),
      ),
    );
  }
}
