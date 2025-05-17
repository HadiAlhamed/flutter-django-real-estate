import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/add_property_controller.dart';
import 'package:real_estate/controllers/bottom_navigation_bar_controller.dart';
import 'package:real_estate/controllers/drop_down_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_bottom_navigation_bar.dart';
import 'package:real_estate/widgets/my_button.dart';
import 'package:real_estate/widgets/my_input_field.dart';

class AddPropertyPage extends StatelessWidget {
  final BottomNavigationBarController bottomController =
      Get.find<BottomNavigationBarController>();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController bathController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final DropDownController dropDownController = Get.find<DropDownController>();

  final AddPropertyController addProController =
      Get.find<AddPropertyController>();
  final List<String> propertyType = ['House', 'Flat', 'Villa'];
  final List<String> cities = [
    "Afrin",
    "Aleppo",
    "Al-Bukamal",
    "Al-Hasakah",
    "Al-Mayadin",
    "Al-Qunaytirah",
    "Al-Rastan",
    "Al-Sabinah",
    "Al-Tabqah",
    "Al-Tall",
    "Ariha",
    "As-Suwayda",
    "Baniyas",
    "Daraa",
    "Damascus",
    "Deir ez-Zor",
    "Douma",
    "Hama",
    "Homs",
    "Idlib",
    "Jableh",
    "Khan Shaykhun",
    "Latakia",
    "Maarrat al-Nu'man",
    "Manbij",
    "Qamishli",
    "Raqqa",
    "Salamiyah",
    "Saraqib",
    "Tadmur (Palmyra)",
    "Tartus",
    "Tell Abyad",
    "Yabrud",
    "Zabadani",
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    String? selectedCity = "", selectedType = '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Add Property", style: h2TitleStyleBlack),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addImagesWidget(screenWidth, screenHeight),
                const SizedBox(height: 20),
                getDropdownFormField(
                  hint: "Property Type",
                  onChanged: (value) {
                    selectedType = value;
                  },
                  validatorHint: "Please choose your property type",
                  wantedList: propertyType,
                ),
                const SizedBox(
                  height: 20,
                ),
                getDropdownFormField(
                  hint: "City",
                  onChanged: (value) {
                    selectedCity = value;
                  },
                  validatorHint:
                      "Please choose the city where this property is located",
                  wantedList: cities,
                ),
                const SizedBox(
                  height: 20,
                ),
                propertyInput(
                  hint: 'Property Address',
                  controller: addressController,
                  suffixWidget: const Icon(Icons.place),
                ),
                propertyInput(
                  hint: 'Number of rooms',
                  controller: roomController,
                  keyboardType: TextInputType.number,
                  suffixWidget: const Icon(
                    Icons.bed,
                  ),
                ),
                propertyInput(
                  hint: 'Number of baths',
                  controller: bathController,
                  keyboardType: TextInputType.number,
                  suffixWidget: const Icon(
                    Icons.bathtub,
                  ),
                ),
                propertyInput(
                  hint: 'Total area by squared meter',
                  controller: areaController,
                  keyboardType: TextInputType.number,
                  suffixWidget: const Icon(
                    Icons.aspect_ratio,
                  ),
                ),
                getFacilitiesBox(screenHeight),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  title: "Add",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: bottomController.selectedIndex,
        bottomController: bottomController,
      ),
    );
  }

  Container getFacilitiesBox(double screenHeight) {
    return Container(
      height: 0.2 * screenHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 207, 205, 205),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Available Facilities :", style: h4TitleStyleBlack),
          GetBuilder<AddPropertyController>(
            id: 'firstRow',
            init: addProController,
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFacility(index: 0, title: "Car Parking"),
                  const SizedBox(
                    width: 4,
                  ),
                  getFacility(index: 1, title: "Wi-Fi & Net"),
                  const SizedBox(
                    width: 4,
                  ),
                  getFacility(index: 2, title: "Restaurant"),
                ],
              );
            },
          ),
          GetBuilder<AddPropertyController>(
            id: 'secondRow',
            init: addProController,
            builder: (controller) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getFacility(index: 3, title: "Laundry"),
                    const SizedBox(
                      width: 4,
                    ),
                    getFacility(index: 4, title: "Sports"),
                    const SizedBox(
                      width: 4,
                    ),
                    getFacility(index: 5, title: "Gym & Fitness"),
                  ]);
            },
          ),
        ],
      ),
    );
  }

  InkWell getFacility({
    required int index,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        addProController.flipSelectedAt(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: addProController.selected[index] ? primaryColor : Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: h2TitleStyleWhite.copyWith(fontSize: 16)),
        ),
      ),
    );
  }

  Container getDropdownFormField(
      {required String hint,
      required String validatorHint,
      required List<String> wantedList,
      required void Function(String?)? onChanged}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: DropdownButtonFormField(
        hint: Text(hint),
        validator: (value) {
          if (value == null || value == '') {
            return validatorHint;
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        items: wantedList.map((element) {
          return DropdownMenuItem(value: element, child: Text(element));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Center addImagesWidget(double screenWidth, double screenHeight) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 218, 218),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 0.5 * screenWidth,
        height: 0.25 * screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.image_search, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Add Photos",
                style: h1TitleStyleBlack.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Max 10 images",
              style: h4TitleStyleBlack.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyInputField propertyInput(
      {required String hint,
      Widget? suffixWidget,
      Widget? prefixWidget,
      required TextEditingController controller,
      bool? readOnly,
      void Function()? ontap,
      TextInputType? keyboardType}) {
    return MyInputField(
      keyboardType: keyboardType,
      prefixWidget: prefixWidget,
      ontap: ontap,
      readOnly: readOnly,
      controller: controller,
      suffixWidget: suffixWidget,
      hint: hint,
      borderSide: BorderSide.none,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}
