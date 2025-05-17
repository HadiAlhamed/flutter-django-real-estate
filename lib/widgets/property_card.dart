import 'package:flutter/material.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';

class PropertyCard extends StatelessWidget {
  final bool? favorite;
  const PropertyCard({super.key, this.favorite});

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
                  const Text(
                    "16K SP",
                    style: h4TitleStyleBlack,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Flat located in Lattakia Near Tishreen University",
                    style: h4TitleStyleGrey.copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      infoIconText(Icons.aspect_ratio_outlined, "200 Sq m"),
                      infoIconText(Icons.bed_outlined, "2"),
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
