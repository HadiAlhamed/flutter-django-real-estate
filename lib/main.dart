import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/bindings/my_bindings.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/views/account_page.dart';
import 'package:real_estate/views/auth/forget_password_page.dart';
import 'package:real_estate/views/auth/login.dart';
import 'package:real_estate/views/auth/signup.dart';
import 'package:real_estate/views/auth/verify_code_page.dart';
import 'package:real_estate/views/favorites_page.dart';
import 'package:real_estate/views/home_page.dart';
import 'package:real_estate/views/maps/open_street_map_with_gps.dart';
import 'package:real_estate/views/profile_page.dart';
import 'package:real_estate/views/property_details_page.dart';

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 235, 235),
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
          name: '/verifyCodePage',
          page: () => VerifyCodePage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/signup',
          page: () => Signup(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/propertyDetails',
          page: () => PropertyDetailsPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/profilePage',
          page: () => ProfilePage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/forgetPassword',
          page: () => ForgetPasswordPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/accountPage',
          page: () => AccountPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/favoritesPage',
          page: () => FavoritesPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
        GetPage(
          name: '/openStreetMap',
          page: () => OpenStreetMapWithGPS(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
