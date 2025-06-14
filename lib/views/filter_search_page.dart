import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/filter_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/widgets/my_button.dart';
import 'package:real_estate/widgets/option_container.dart';

class FilterSearchPage extends StatelessWidget {
  FilterSearchPage({super.key});
  final FilterController filterController = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHegiht = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.category),
        title: const Text("Filters"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Property Listing"),
            const SizedBox(height: 20),
            forSaleRentWidget(),
            const SizedBox(
              height: 20,
            ),
            const Text("Order By"),
            const SizedBox(height: 20),
            orderOptions(),
            const SizedBox(height: 20),
            const Text("Property Type"),
            const SizedBox(height: 20),
            propertyTypeOptions(),
            const SizedBox(height: 20),
            GetBuilder<FilterController>(
              init: filterController,
              id: "saveButton",
              builder: (controller) => MyButton(
                title: filterController.isSaveLoading ? null : "Save",
                onPressed: () async {
                  filterController.changeIsSaveLoading(true);
                  await filterController.save();
                  filterController.changeIsSaveLoading(false);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row forSaleRentWidget() {
    return Row(
      children: [
        GetBuilder<FilterController>(
          init: filterController,
          id: "isForRent",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "For Rent",
              colorCondition: filterController.isForRent,
              onTap: () {
                filterController.flipIsForRent();
              },
            ),
          ),
        ),
        GetBuilder<FilterController>(
          init: filterController,
          id: "isForSale",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "For Sale",
              colorCondition: filterController.isForSale,
              onTap: () {
                filterController.flipIsForSale();
              },
            ),
          ),
        ),
      ],
    );
  }

  Row orderOptions() {
    return Row(
      children: [
        GetBuilder<FilterController>(
          init: filterController,
          id: "orderByArea",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "By area",
              colorCondition: filterController.orderByArea,
              onTap: () {
                filterController.flipOrderByArea();
              },
            ),
          ),
        ),
        GetBuilder<FilterController>(
          init: filterController,
          id: "orderByPrice",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "By price",
              colorCondition: filterController.orderByPrice,
              onTap: () {
                filterController.flipOrderByPrice();
              },
            ),
          ),
        ),
        GetBuilder<FilterController>(
          init: filterController,
          id: "orderAsc",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              onTap: () {
                filterController.flipOrderAsc();
              },
              label: "Ascending",
              colorCondition: filterController.orderAsc,
            ),
          ),
        ),
      ],
    );
  }

  Row propertyTypeOptions() {
    return Row(
      children: [
        GetBuilder<FilterController>(
          init: filterController,
          id: "villa",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "Villa",
              colorCondition: filterController.villa,
              onTap: () {
                filterController.flipVilla();
              },
            ),
          ),
        ),
        GetBuilder<FilterController>(
          init: filterController,
          id: "flat",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              label: "Flat",
              colorCondition: filterController.flat,
              onTap: () {
                filterController.flipFlat();
              },
            ),
          ),
        ),
        GetBuilder<FilterController>(
          init: filterController,
          id: "house",
          builder: (controller) => Expanded(
            flex: 1,
            child: OptionContainer(
              onTap: () {
                filterController.flipHouse();
              },
              label: "House",
              colorCondition: filterController.house,
            ),
          ),
        ),
      ],
    );
  }
}
