import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/controllers/drop_down_controller.dart';
import 'package:real_estate/controllers/home_page_tab_controller.dart';
import 'package:real_estate/controllers/login_controller.dart';
import 'package:real_estate/controllers/signup_controller.dart';
import 'package:real_estate/controllers/forget_password_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(BottomNavigationBarController());
    Get.put(HomePageTabController());
    Get.put(DropDownController());
    Get.put(ForgetPasswordController());
  }
}
