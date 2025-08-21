import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class FindNewCoachScreen extends StatefulWidget {
  const FindNewCoachScreen({super.key});

  @override
  State<FindNewCoachScreen> createState() => _FindNewCoachScreenState();
}

class _FindNewCoachScreenState extends State<FindNewCoachScreen> {

  final textController = TextEditingController();

  List<String> gender = [
    "Man",
    "Women",
    "Non-binary",
    "Prefer not to say",
    "Self-describe"
  ];

  List<String> language = [
    "English",
    "Bangla",
    "Hindi",
    "Spanish"
  ];

  List<String> coachFocus = [
    "Mental Health & Wellbeing",
    "Professional Growth",
    "Networking Support",
    "Life Transitions",
    "Inclusion & Accessibility",
    "Purpose & Values",
    "Movement-Based Coaching"
  ];

  List<String> preferredCoach =[
    "In-Person",
    "Online (Video/Call)",
    "Walk-Based Sessions (Netwalking style)"
  ];

  List<String> coachLevel = [
    "Beginner",
    "Intermediate",
    "Expert",
    "Certified / Accredited"
  ];

  List<String> coachAvailability = [
    "Morning",
    "Afternoon",
    "Evening"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Find New Coach"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        children: [
          Text("What do you need help with?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          ),),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/right.svg'),
                SizedBox(height: 4,),
                CustomTextField(controller: textController,
                maxLines: 5,
                filColor: Colors.white,
                borderColor: Color(0xFFB3CBE5),
                hintText: 'Write here',)
              ],
            )
          ),
          SizedBox(height: 12,),
        CustomDropdownCheckbox(
            title: "Enter your gender",
            bgColor: Colors.white,
            showCheckbox: false,
            leadingIcon: SvgPicture.asset('assets/icons/gender.svg'),
            options: gender,
            onChanged: (val){

            }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Language",
              options: language,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: SvgPicture.asset('assets/icons/language.svg',
                height: 24,
                width: 24,),
              onChanged: (val){
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Coaching Focus",
              options: coachFocus,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF094EBE),
                      Color(0xFF15AABA)
                    ]
                  )
                ),
              ),
              onChanged: (val){
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Preferred Coaching Format",
              options: preferredCoach,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF48F6A4),
                          Color(0xFF0F8A98)
                        ]
                    )
                ),
              ),
              onChanged: (val){
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Coach Experience Level",
              options: coachLevel,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF595CFF),
                          Color(0xFFC6F8FF)
                        ]
                    )
                ),
              ),
              onChanged: (val){
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Coach Availability",
              options: coachAvailability,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFD38656),
                          Color(0xFFF9AC69)
                        ]
                    )
                ),
              ),
              onChanged: (val){
              }),
          SizedBox(height: 50,),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 0.5)
                  ),
                  child: Center(
                    child: Text("Clear",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
                  ),
                ),
              ),
              SizedBox(width: 24,),
              Expanded(child: CustomButton(onTap: (){},
                  text: 'Apply Now'))
            ],
          )

        ],
      ),
    );
  }
}
