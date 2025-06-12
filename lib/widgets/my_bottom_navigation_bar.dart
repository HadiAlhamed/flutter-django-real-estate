import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final BottomNavigationBarController bottomController;

  const MyBottomNavigationBar({
    super.key,
    required this.bottomController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      init: bottomController,
      builder: (controller) => BottomNavigationBar(
        currentIndex: bottomController.selectedIndex,
        selectedItemColor: primaryColor,
        selectedLabelStyle: h4TitleStylePrimary,
        unselectedItemColor: greyText,
        unselectedLabelStyle: h4TitleStyleGrey,
        showUnselectedLabels: true,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        onTap: handleBottomNavigation,
        items: [
          getBottomItem(
            icon: const Icon(Icons.home),
            label: "Home",
          ),
          getBottomItem(
            icon: const Icon(
              Icons.message_outlined,
            ),
            label: "Messages",
          ),
          if (bottomController.isSeller)
            const BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
          getBottomItem(
            icon: const Icon(Icons.favorite),
            label: "Favorites",
          ),
          getBottomItem(
            icon: const Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem getBottomItem({
    required String label,
    required Icon icon,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(
          top: bottomController.isSeller ? 0 : 8.0,
        ),
        child: icon,
      ),
      label: label,
    );
  }

  void handleBottomNavigation(index) {
    print("index : $index");
    bottomController.changeSelectedIndex(index: index);
    if (index == 0) {
      //go home
      Get.offNamed('/home');
    }
    if (index == 1) {
      //go to messages
    }
    if (index == 2) {
      if (bottomController.isSeller) {
        Get.offNamed('/addPropertyPage');
      } else {
        Get.offNamed('/favoritesPage');
      }
    }
    if (index == 3) {
      //go accountpage
      if (bottomController.isSeller) {
        Get.offNamed('/favoritesPage');
      } else {
        Get.offNamed('/accountPage');
      }
    }
    if (index == 4) {
      Get.offNamed('/accountPage');
    }
  }
}
