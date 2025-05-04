import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final BottomNavigationBarController bottomController;
  const MyBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.bottomController,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      selectedLabelStyle: h4TitleStylePrimary,
      unselectedItemColor: greyText,
      unselectedLabelStyle: h4TitleStyleGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        print("index : $index");
        bottomController.changeSelectedIndex(index: index);
        if (index == 0) {
          //go home
          Get.offNamed('/home');
        }
        if (index == 2) {
          Get.offNamed('/favoritesPage');
        }
        if (index == 3) {
          //go accountpage
          Get.offNamed('/accountPage');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message_outlined,
          ),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
          label: "Favorites",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Account",
        ),
      ],
    );
  }
}
