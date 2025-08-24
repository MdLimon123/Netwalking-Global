import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final commentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Report a Problem"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Us",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 8,),
                Text("Have a question, feedback, or need help? Our team is here to assist you",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF696767)

                ),),
                SizedBox(height: 16,),
                CustomTextField(controller: nameTextController,
                hintText: "Enter your name",),
                SizedBox(height: 12,),
                CustomTextField(controller: emailTextController,
                hintText: "Enter your email",),
                SizedBox(height: 12,),
                CustomTextField(controller: phoneTextController,
                hintText: "Enter your phone number",),
                SizedBox(height: 28,),
                Text("Your Comment",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 4),
                CustomTextField(controller: commentTextController,
                hintText: "Write here",),
                SizedBox(height: 12,),
                SizedBox(height: 74,),
                CustomButton(onTap: (){},
                    text: "Submit")
              ],
            ),

          )
        ],
      ),
    );
  }
}
