import 'package:flutter/material.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_button.dart';
import 'package:real_estate/widgets/my_input_field.dart';
import 'package:real_estate/widgets/my_row_button.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.2, bottom: 20),
                height: 200,
                child: Image.asset(
                  "assets/images/Aqari_logo_primary_towers.png",
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Text("Login To Your Account", style: h1TitleStyleBlack),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      MyInputField(
                        hint: 'Email',
                        prefixIcon: Icons.email,
                      ),
                      MyInputField(
                        hint: 'Password',
                        prefixIcon: Icons.password,
                        isObsecure: true,
                      ),
                      MyButton(title: 'Sign In'),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forget Password?",
                            style: h3TitleStylePrimary,
                          ),
                        ),
                      ),
                      MyRowButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Sign in with ",
                              style: buttonTextStyleWhite,
                            ),
                            SizedBox(
                              height: 30,
                              child: Image.asset(
                                  'assets/images/logos/google_logo.png'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Doesn't have an account? ",
                              style: h4TitleStyleGrey,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                "register now",
                                style: h3TitleStylePrimary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
