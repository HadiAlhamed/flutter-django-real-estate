import 'package:get/get.dart';
import 'package:real_estate/controllers/login_controller.dart';
import 'package:real_estate/controllers/signup_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
    Get.put(SignupController());
  }
}
