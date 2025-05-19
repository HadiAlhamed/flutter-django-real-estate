import 'package:flutter/material.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class PropertyCard extends StatelessWidget {
  final bool? favorite;
  final Property property;
  const PropertyCard({
    super.key,
    this.favorite,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                "assets/images/house.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${property.price.toString()} \$",
                    style: h4TitleStyleBlack,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${property.propertyType} located in ${property.city}",
                    style: h4TitleStyleGrey.copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      infoIconText(Icons.aspect_ratio_outlined,
                          "${property.area.toString()} Sq m"),
                      infoIconText(Icons.bed_outlined,
                          property.numberOfRooms.toString()),
                      infoIconText(Icons.bathtub_outlined, "1"),
                      if (favorite ?? false)
                        const Icon(Icons.favorite, color: primaryColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: primaryColor),
        const SizedBox(width: 4),
        Text(
          text,
          style: h4TitleStyleGrey.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
