import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/account_page_controller.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountPageController>(
        id: "sellerMode",
        builder: (controller) {
          if (!controller.isSeller) return const SizedBox.shrink();
          return FloatingActionButton(
            onPressed: () {
              Get.offNamed('/addPropertyPage', arguments: {
                "isAdd": true,
              });
            },
            child: const Icon(Icons.add),
          );
        });
  }
}
