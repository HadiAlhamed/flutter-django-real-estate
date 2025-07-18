import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final BottomNavigationBarController bottomController;

  const MyBottomNavigationBar({
    super.key,
    required this.bottomController,
  });

  @override
  Widget build(BuildContext context) {
    final iconList = [
      Icons.home,
      Icons.message_outlined,
      Icons.favorite,
      Icons.person,
    ];

    return GetBuilder<BottomNavigationBarController>(
      init: bottomController,
      builder: (controller) =>
          AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: controller.selectedIndex,
            gapLocation: GapLocation.center ,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            backgroundColor:Theme.of(context).brightness == Brightness.light ?  Colors.white : Colors.black,
            activeColor: primaryColor,
            inactiveColor: greyText,
            iconSize: 28,
            leftCornerRadius: 24,
            rightCornerRadius: 24,
            onTap: (index) => handleBottomNavigation(index),
          ),
        
    );
  }

  void handleBottomNavigation(int index) {
    print("index : $index");
    bottomController.changeSelectedIndex(index: index);

    if (index == 0) {
      Get.offNamed('/home');
    } else if (index == 1) {
      Get.offNamed("/chatsPage");
    } else if (index == 2) {
      
        Get.offNamed('/favoritesPage');
      
    } else if (index == 3) {
      Get.offNamed('/accountPage');
      
    } 
  }
}
