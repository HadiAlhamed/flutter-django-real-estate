import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({super.key});
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 4),
            child: ListTile(
              onTap: () {
                Get.toNamed('/chatPage');
              },
              title: const Text("Joe Biden"),
              subtitle: const Text("please call me as soon as possible!"),
              leading: CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: const AssetImage('assets/images/person.jpg'),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("12:25 AM"),
                  CircleAvatar(
                    radius: screenWidth * 0.03,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? primaryColor
                            : primaryColorInactive,
                    child: const Text("3"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(bottomController: bottomController),
    );
  }
}
