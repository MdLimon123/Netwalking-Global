import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
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
                child: SvgPicture.asset('assets/icons/otp.svg'),
              ),
            ),
            SizedBox(height: 36,),
            Center(
              child: Text("Enter OTP",
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
                child: Text("Please input the code, Check your mail",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),
                  textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 50,),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFFE6EEF7),
              focusedBorderColor: Color(0xFFE6EEF7),
              enabledBorderColor: Color(0xFFE6EEF7),
              showFieldAsBox: true,
              filled: true,
              fieldWidth: 45,
              fieldHeight: 45,
              borderRadius: BorderRadius.circular(100),
              textStyle: TextStyle(fontSize: 12, color: AppColors.textColor,
                  fontWeight: FontWeight.w400),
              fillColor: Color(0xFFE6EEF7),
              onCodeChanged: (String code) {

              },
              onSubmit: (String verificationCode) {
              },
            ),
            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(onTap: (){
                Get.offAllNamed(AppRoutes.resetPasswordScreen);
              },
                  text: "Submit Now"),
            )
          ],
        ),
      ),
    );
  }
}
