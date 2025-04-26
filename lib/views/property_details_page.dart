import 'package:flutter/material.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/house.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Text("16,000 SP", style: h1TitleStyleBlack),
            ),
            Divider(),
            roomsInfo(),
            Divider(),
            propertyDetails(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Row(
                children: [
                  Icon(Icons.gps_fixed),
                  const SizedBox(width: 10),
                  Text("Location", style: h3TitleStyleBlack),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding propertyDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Property Details",
            style: h2TitleStyleBlack,
          ),
          const SizedBox(height: 15),
          Text(
            "a 200 square meter house with a backyard that has a pool and a playground for kids",
            style: h4TitleStyleBlack.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Padding roomsInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Flat in Lattakia Near Tishreen University With Beautiful View",
              style: h3TitleStyleBlack),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              detailInfo(Icons.bed, "2 beds"),
              detailInfo(Icons.bathtub, "2 bath"),
              detailInfo(Icons.aspect_ratio, "200 Sqm"),
            ],
          ),
        ],
      ),
    );
  }

  Row detailInfo(IconData iconData, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(iconData, color: primaryColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
