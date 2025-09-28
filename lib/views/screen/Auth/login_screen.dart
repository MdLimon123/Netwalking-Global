import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/auth_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';

import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Auth/forget_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _authController = Get.put(AuthController());
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _fromKey,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    padding: EdgeInsets.only(top: 40),
                    width: double.infinity,
                    color: Color(0xFFE6EEF7),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SvgPicture.asset('assets/icons/welcome.svg'),
                    ),
                  ),
                  SizedBox(height: 36),
                  Center(
                    child: Text(
                      "welcome_back".tr,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        "welcome_subtitle".tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                      controller: emailTextController,
                      hintText: "enter_email".tr,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTextField(
                      controller: passwordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        } else if (value.length < 4) {
                          return 'Password must be at least 4 characters';
                        }
                        return null;
                      },
                      hintText: "enter_password".tr,
                      isPassword: true,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ForgetScreen());
                        },
                        child: Text(
                          "forget_password".tr,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFF0F43)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Obx(
                      ()=> CustomButton(
                        loading: _authController.isLoginLoading.value,
                        onTap: () {
                          if(_fromKey.currentState!.validate()){
                            _authController.login(
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim());
                          }
                        },
                        text: "login".tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "dont_have_account".tr,
                        style: TextStyle(
                            color: Color(0xFF545454),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: " sign_up".tr,
                            style: TextStyle(
                                color: Color(0xFF145788),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAllNamed(AppRoutes.signupScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Color(0xFFB3CBE5),
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          "or_signup_with".tr,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Color(0xFFB3CBE5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/facebook.svg'),
                      SizedBox(width: 16),
                      SvgPicture.asset('assets/icons/google.svg'),
                    ],
                  )
                ],
              )),
        ));
  }
}
