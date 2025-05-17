import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';

class AddPropertyPage extends StatelessWidget {
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();
  AddPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("add new property page")),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: bottomController.selectedIndex,
        bottomController: bottomController,
      ),
    );
  }
}
