import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Change Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 33),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: ListView(
            children: [
              CustomTextField(controller: oldPassword,
              isPassword: true,
              hintText: "Enter your old password",),
              SizedBox(height: 12,),
              CustomTextField(controller: newPassword,
              hintText: 'Enter new password',
              isPassword: true,),
              SizedBox(height: 12,),
              CustomTextField(controller: confirmPassword,
              hintText: "Confirm password",
              isPassword: true,),

              SizedBox(height: 50,),
              CustomButton(onTap: (){},
                  text: "Save Changes")

            ],
          ),
        ),
      ),
    );
  }
}
