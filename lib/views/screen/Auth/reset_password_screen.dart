import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                color: Color(0xFFE6EEF7),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SvgPicture.asset('assets/icons/reset_password.svg'),
                ),
              ),
              SizedBox(height: 36,),
              Center(
                child: Text("Set New Password",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor
                  ),),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text("Please Input minimum 6 character password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor
                    ),
                    textAlign: TextAlign.center,),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(controller: passwordController,
                  isPassword: true,
                  hintText: 'Enter your password',),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(controller: confirmController,
                  isPassword: true,
                  hintText: 'Confirm password',),
              ),


              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(onTap: (){

                },
                    text: "Confirm"),
              ),


            ],
          ),
        )
    );
  }
}
