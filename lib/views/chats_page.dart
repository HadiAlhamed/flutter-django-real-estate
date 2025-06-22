import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/widgets/chat_tile.dart';
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
          return ChatTile(
            name: 'Joe Biden',
            lastMessage: 'please call me as fast as possible',
            lastMessageTime: "12:25 AM",
            newMessages: 4,
            screenWidth: screenWidth,
          );
        },
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(bottomController: bottomController),
    );
  }
}
