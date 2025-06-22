import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/bindings/my_bindings.dart';
import 'package:real_estate/controllers/theme_controller.dart';
import 'package:real_estate/services/api.dart';
import 'package:real_estate/services/auth_apis/auth_apis.dart';
import 'package:real_estate/services/auth_services/token_service.dart';
import 'package:real_estate/services/properties_apis/properties_apis.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/views/account_page.dart';
import 'package:real_estate/views/add_property_page.dart';
import 'package:real_estate/views/auth/forget_password_page.dart';
import 'package:real_estate/views/auth/login.dart';
import 'package:real_estate/views/auth/signup.dart';
import 'package:real_estate/views/auth/verify_code_page.dart';
import 'package:real_estate/views/chat_page.dart';
import 'package:real_estate/views/chats_page.dart';
import 'package:real_estate/views/favorites_page.dart';
import 'package:real_estate/views/filter_search_page.dart';
import 'package:real_estate/views/home_page.dart';
import 'package:real_estate/views/maps/open_street_map_with_gps.dart';
import 'package:real_estate/views/my_properties_page.dart';
import 'package:real_estate/views/profile_page.dart';
import 'package:real_estate/views/property_details_page.dart';
import 'package:real_estate/views/search_result_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    AuthApis.init(),
    PropertiesApis.init(),
    TokenService.clearTokens(),
    ThemeController().init(),
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    print("remember me : ${Api.box.read("rememberMe")}");
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Real Estate',
        theme: myLightTheme,
        darkTheme: myDarkTheme,
        themeMode: themeController.themeMode.value,
        initialRoute: Api.box.read('rememberMe') == null || Api.box.read('rememberMe') == false ? '/login' : '/home',
        initialBinding: MyBindings(),
        getPages: [
          
          GetPage(
            name: '/login',
            page: () => Login(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/myPropertiesPage',
            page: () => const MyPropertiesPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          
          GetPage(
            name: '/filterSearchPage',
            page: () => const FilterSearchPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/verifyCodePage',
            page: () => const VerifyCodePage(),
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
            name: '/chatPage',
            page: () =>   ChatPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/propertyDetails',
            page: () => const PropertyDetailsPage(),
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
            page: () => const FavoritesPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/chatsPage',
            page: () =>  ChatsPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/addPropertyPage',
            page: () => const AddPropertyPage(),
            
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/searchResultPage',
            page: () => const SearchResultPage(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
          GetPage(
            name: '/openStreetMap',
            page: () => const OpenStreetMapWithGPS(),
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
