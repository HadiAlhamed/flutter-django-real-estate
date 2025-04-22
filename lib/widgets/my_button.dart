// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  const MyButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 23),
      child: TextButton(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(const Color.fromARGB(255, 214, 167, 224)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.only(top: 12, bottom: 12),
          ),
          backgroundColor: WidgetStateProperty.all(primaryColor),
        ),
        onPressed: onPressed,
        child: title == null
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                title!,
                style: buttonTextStyleWhite,
              ),
      ),
    );
  }
}
