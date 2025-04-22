import 'package:flutter/material.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class MyButton extends StatelessWidget {
  final String title;
  const MyButton({super.key, required this.title});

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
        onPressed: () {},
        child: Text(
          title,
          style: buttonTextStyleWhite,
        ),
      ),
    );
  }
}
