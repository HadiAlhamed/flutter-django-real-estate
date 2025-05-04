import 'package:get/get.dart';

class AccountPageController extends GetxController {
  bool isDark = false;
  bool isSeller = false;
  void changeIsDark(bool value) {
    isDark = value;
    update(['darkMode']);
  }

  void changeIsSeller(bool value) {
    isSeller = value;
    update(['sellerMode']);
  }
}
