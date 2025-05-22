import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_estate/controllers/account_page_controller.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/services/auth_apis/auth_apis.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';
import 'package:real_estate/widgets/my_snackbar.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final AccountPageController accountController =
      Get.find<AccountPageController>();
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                accountHeader(screenHeight),
                const SizedBox(height: 60),
                GetBuilder<AccountPageController>(
                  id: 'sellerMode',
                  init: accountController,
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                        accountController.isSeller ? "Selling" : "Buying",
                        style: h2TitleStyleBlack),
                  ),
                ),
                const SizedBox(height: 20),
                getListTiles(),
              ],
            ),
          ),
          getSellerModeSwitch(screenHeight)
        ],
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        init: bottomController,
        builder: (controller) {
          return MyBottomNavigationBar(
            selectedIndex: bottomController.selectedIndex,
            bottomController: bottomController,
          );
        },
      ),
    );
  }

  Positioned getSellerModeSwitch(double screenHeight) {
    return Positioned(
      top: 0.2 * screenHeight - 0.5 * (0.08 * screenHeight),
      left: 20,
      right: 20,
      child: Container(
        height: 0.08 * screenHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: GetBuilder<AccountPageController>(
          id: 'sellerMode',
          init: accountController,
          builder: (controller) => ListTile(
            title: const Text("Seller Mode", style: h2TitleStyleBlack),
            trailing: getSwitch(
              onChanged: (value) async {
                bool result = await AuthApis.changeIsSeller(value);
                if (result) {
                  accountController.changeIsSeller(value);
                  bottomController.changeIsSeller(value);
                } else {
                  Get.showSnackbar(
                    MySnackbar(
                        success: false,
                        title: "Changing Seller Mode",
                        message: "Failed to change , please try again later."),
                  );
                }
              },
              switchValue: accountController.isSeller,
            ),
          ),
        ),
      ),
    );
  }

  Container accountHeader(double screenHeight) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      height: 0.2 * screenHeight,
      child: const ListTile(
        contentPadding: EdgeInsets.only(top: 60, left: 10, right: 8),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/person.jpg'),
        ),
        title: Text("Joe Biden", style: h2TitleStyleWhite),
        trailing: Icon(Icons.notifications, size: 30, color: Colors.white),
      ),
    );
  }

  Column getListTiles() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: const Icon(Icons.calendar_month),
          title: const Text("My Booking", style: h4TitleStyleBlack),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 32),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: const Icon(Icons.person_2_outlined),
          title: const Text("Profile", style: h4TitleStyleBlack),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 32),
          onTap: () {
            Get.toNamed('/profilePage');
          },
        ),
        const SizedBox(height: 10),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: const Icon(Icons.notifications),
          title: const Text("Notifications", style: h4TitleStyleBlack),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 32),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        darkModeSwitch(),
        const SizedBox(height: 10),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: const Icon(Icons.logout_outlined, color: Colors.red),
          title: const Text("Logout", style: h4TitleStyleRed),
          trailing: const Icon(Icons.keyboard_arrow_right, size: 32),
          onTap: handleLogout,
        ),
      ],
    );
  }

  void handleLogout() async {
    final result = await AuthApis.logout();
    if (result) {
      //remember to clear stuff
      bottomController.clear();
      Get.offAllNamed('/login');
    } else {
      Get.showSnackbar(
        MySnackbar(
            success: false,
            title: 'Logout',
            message: 'An error has occurred, please try again later'),
      );
    }
  }

  GetBuilder<AccountPageController> darkModeSwitch() {
    return GetBuilder<AccountPageController>(
      id: "darkMode",
      init: accountController,
      builder: (controller) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: const Icon(Icons.dark_mode_outlined),
        title: const Text("Dark Mode", style: h4TitleStyleBlack),
        trailing: getSwitch(
            onChanged: (value) {
              accountController.changeIsDark(value);
            },
            switchValue: accountController.isDark),
      ),
    );
  }

  Switch getSwitch({
    required bool switchValue,
    required void Function(bool)? onChanged,
  }) {
    return Switch(
      value: switchValue,
      onChanged: onChanged,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
      activeTrackColor: const Color.fromARGB(255, 206, 150, 181),
      activeColor: primaryColor,
    );
  }
}
