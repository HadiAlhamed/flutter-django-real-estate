import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/bindings/my_bindings.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/views/auth/login.dart';
import 'package:real_estate/views/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(
          name: '/login',
          page: () => Login(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/signup',
          page: () => Signup(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
