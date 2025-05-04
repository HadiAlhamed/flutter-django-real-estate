import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:real_estate/controllers/forget_password_controller.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_button.dart';
import 'package:real_estate/widgets/my_input_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController cpasswordController = TextEditingController();
  final ForgetPasswordController fpController =
      Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<ForgetPasswordController>(
                init: fpController,
                id: 'image',
                builder: (controller) => Image.asset(!fpController.codeVerified
                    ? 'assets/gifs/Forgot_password_transparent.gif'
                    : 'assets/gifs/Forgot_password_1_transparent.gif'),
              ),
              const SizedBox(height: 20),
              GetBuilder<ForgetPasswordController>(
                init: fpController,
                id: 'main',
                builder: (controller) {
                  if (!fpController.emailEntered) {
                    return getEmailWidgets();
                  }
                  if (!fpController.codeVerified) {
                    return getVerificationWidgets(context, screenWidth);
                  }
                  return getNewPasswordWidgets();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column getNewPasswordWidgets() {
    return Column(
      children: [
        MyInputField(
          hint: 'New password',
          controller: passwordController,
        ),
        MyInputField(
          hint: 'Confirm password',
          controller: cpasswordController,
        ),
        MyButton(
          title: "Continue",
          onPressed: () {},
        ),
      ],
    );
  }

  Column getVerificationWidgets(BuildContext context, double screenWidth) {
    return Column(
      children: [
        Text(
          "Code has been sent to example@gmail.com",
          style: h3TitleStyleBlack,
        ),
        const SizedBox(height: 20),
        PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: screenWidth / 8,
            inactiveFillColor: Colors.white,
            activeFillColor: Colors.white,
            inactiveColor: primaryColor,
          ),
          animationDuration: Duration(milliseconds: 300),
          onCompleted: (v) {
            print("Completed: $v");
            //code to verify = v
            fpController.codeValue = v;
          },
          onChanged: (value) {
            print(value);
          },
        ),
        const SizedBox(height: 20),
        MyButton(
          title: 'Verify',
          onPressed: () {
            fpController.changeCodeFlag(true);
          },
        ),
      ],
    );
  }

  Column getEmailWidgets() {
    return Column(
      children: [
        Text(
          "Please enter your email to receive a verification code",
          style: h3TitleStyleBlack,
        ),
        const SizedBox(height: 20),
        MyInputField(
          hint: 'Email',
          controller: emailController,
        ),
        MyButton(
          title: 'Continue',
          onPressed: () {
            if (emailController.text == '') {
              return;
              //later add a snackbar telling the user to give an email
            }
            //store the email for the post api

            fpController.changeEmailFlag(true);
            fpController.emailValue = emailController.text;
          },
        ),
      ],
    );
  }
}
