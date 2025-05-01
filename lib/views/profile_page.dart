import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controllers/drop_down_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_button.dart';
import 'package:real_estate/widgets/my_input_field.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final DropDownController dropDownController = Get.find<DropDownController>();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 235, 235),
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          "Profile",
          style: h2TitleStyleBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                thickness: 2,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/Aqari_logo_primary_towers.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.auto_fix_high,
                    color: primaryColor,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              myProfileInput(
                hint: 'First Name',
                controller: firstNameController,
              ),
              myProfileInput(hint: 'Last Name', controller: lastNameController),
              myProfileInput(hint: 'Email', controller: emailController),
              myProfileInput(
                readOnly: true,
                controller: birthDateController,
                hint: 'date of birth',
                suffixWidget: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () async {
                    DateTime? chosenBirthDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      currentDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (chosenBirthDate != null) {
                      String formatedDate =
                          DateFormat('dd/MM/yyyy').format(chosenBirthDate);
                      birthDateController.text = formatedDate;
                    }
                  },
                ),
              ),
              genderDropDownMenu(),
              const SizedBox(height: 20),
              myProfileInput(
                hint: 'Country',
                controller: countryController,
                suffixWidget: Icon(Icons.arrow_drop_down),
                readOnly: true,
                ontap: () {
                  print("HI");
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      countryController.text =
                          "${country.flagEmoji} ${country.name}";
                    },
                  );
                },
              ),
              myProfileInput(
                hint: 'Phone number',
                keyboardType: TextInputType.phone,
                controller: phoneController,
                prefixWidget: GetBuilder<DropDownController>(
                  id: 'country',
                  init: dropDownController,
                  builder: (controller) {
                    return SizedBox(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              dropDownController.changeSelectedCountry(
                                  country:
                                      "${country.flagEmoji} ${country.phoneCode}");
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(dropDownController.selectedCountry),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              MyButton(title: 'Update'),
            ],
          ),
        ),
      ),
    );
  }

  GetBuilder<DropDownController> genderDropDownMenu() {
    return GetBuilder<DropDownController>(
      id: 'gender',
      init: dropDownController,
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: DropdownButtonFormField(
            value: dropDownController.selectedGender,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            items: dropDownController.genders.map((gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (gender) {
              dropDownController.changeSelectedGender(
                gender: gender,
              );
            },
            validator: (gender) =>
                gender == null ? "please choose a gender" : null,
          ),
        );
      },
    );
  }

  MyInputField myProfileInput(
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
        boxShadow: [
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
