import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.only(top: 40),
              width: double.infinity,
              color: const Color(0xFFE6EEF7),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: SvgPicture.asset('assets/icons/signup.svg'),
              ),
            ),
            const SizedBox(height: 36),
            Center(
              child: Text(
                "signup".tr,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  "create_account".tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: emailTextController,
                hintText: "enter_name".tr,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: emailTextController,
                hintText: "enter_email".tr,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextField(
                controller: passwordTextController,
                hintText: "enter_password".tr,
                isPassword: true,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                onTap: () {
                  Get.offAllNamed(AppRoutes.setupProfileScreen);
                },
                text: "signup".tr,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "already_have_account".tr,
                  style: const TextStyle(
                    color: Color(0xFF545454),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: " login".tr,
                      style: const TextStyle(
                        color: Color(0xFF145788),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFFB3CBE5),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    "or_signup_with".tr,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xFFB3CBE5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/facebook.svg'),
                const SizedBox(width: 16),
                SvgPicture.asset('assets/icons/google.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
