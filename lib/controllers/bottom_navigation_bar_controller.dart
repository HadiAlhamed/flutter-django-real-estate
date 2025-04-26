import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int selectedIndex = 0;
  void changeSelectedIndex({required int index}) {
    selectedIndex = index;
    update();
  }
}
