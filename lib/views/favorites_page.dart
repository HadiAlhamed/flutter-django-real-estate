import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/controllers/property_details_controller.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';
import 'package:real_estate/widgets/property_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();

  final PropertyDetailsController pdController =
      Get.find<PropertyDetailsController>();
  late final List<Property> favoritesProperties;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoritesProperties = pdController.isFavoriteSet.toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    
    pdController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child:favoritesProperties.isEmpty ? const Center(child: Text("You have no favorites yet",),) : GridView.builder(
          padding: const EdgeInsets.only(top: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Height to width ratio
          ),
          itemCount:
              favoritesProperties.length, // For example, 10 items for each tab
          itemBuilder: (context, index) {
            return GetBuilder(
              init: pdController,
              id: "isFavorite${favoritesProperties[index].id}",
              builder: (controller) {
                return PropertyCard(
                  favorite:
                      pdController.isFavorite[favoritesProperties[index].id!],
                  property: favoritesProperties[index],
                  pdController: pdController,
                );
              },
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
