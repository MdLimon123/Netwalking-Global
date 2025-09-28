import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/auth_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final _authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 40),
                width: double.infinity,
                color: Color(0xFFE6EEF7),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SvgPicture.asset('assets/icons/reset_password.svg'),
                ),
              ),
              SizedBox(height: 36),
              Center(
                child: Text(
                  "set_new_password".tr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    "password_instruction".tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                  isPassword: true,
                  hintText: "enter_password".tr,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  controller: confirmController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your confirm password';
                    } else if (value.length < 4) {
                      return 'Password must be at least 4 characters';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  isPassword: true,
                  hintText: "confirm_password".tr,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(
                  ()=> CustomButton(
                    loading: _authController.isResetPassLoading.value,
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        _authController.resetPassword(
                            password: passwordController.text.trim(),
                            confirmPassword: confirmController.text.trim());
                      }
                    },
                    text: "confirm".tr,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
