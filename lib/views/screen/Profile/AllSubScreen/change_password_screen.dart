import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/profile_controller.dart';
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

  final _formKey = GlobalKey<FormState>();

  final _profileController = Get.put(ProfileController());

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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextField(controller: oldPassword,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your old password";
                  }
                  return null;
                },
                isPassword: true,
                hintText: "Enter your old password",),
                SizedBox(height: 12,),
                CustomTextField(controller: newPassword,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your new password";
                  }
                  return null;
                },
                hintText: 'Enter new password',
                isPassword: true,),
                SizedBox(height: 12,),
                CustomTextField(controller: confirmPassword,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your confirm password";
                  }
                  return null;
                },
                hintText: "Confirm password",
                isPassword: true,),

                SizedBox(height: 50,),
                Obx(
                    ()=> CustomButton(
                    loading: _profileController.isChangePasswordLoading.value,
                      onTap: (){
                    if(_formKey.currentState!.validate()){
                      _profileController.changePassword(
                          oldPassword: oldPassword.text,
                          newPassword: newPassword.text,
                          confirmPassword: confirmPassword.text);
                    }
                  },
                      text: "Save Changes"),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
