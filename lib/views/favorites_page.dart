import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';
import 'package:real_estate/widgets/property_card.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Height to width ratio
          ),
          itemCount: 10, // For example, 10 items for each tab
          itemBuilder: (context, index) {
            return PropertyCard(
              favorite: true,
              property: Property(
                area: 0,
                city: 'dama',
                isForRent: true,
                numberOfRooms: 2,
                price: 200,
                propertyType: 'villa',
                address: 'near my hear',
                id: 212,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        init: bottomController,
        builder: (controller) {
          return MyBottomNavigationBar(
            
            bottomController: bottomController,
          );
        },
      ),
    );
  }
}
