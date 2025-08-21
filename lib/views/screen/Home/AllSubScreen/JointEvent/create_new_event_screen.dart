import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {

  final eventTitleController = TextEditingController();

  List<String> type = [
    "Professional Networking Event",
    "Social Event",
    "Community Walk",
    "Clean-Up Walk",
    "Dog-Friendly Walk",
    "Women’s Walk",
    "Nature Exploration Walk",
    "Wellness Classes"
  ];

  List<String> location = [
    "Current Location",
    "Within 2 KM",
    "Within 5 KM",
    "Within 10 KM"

  ];
  List<String> pace = [
    'Slow',
    'Moderate',
    'Fast',
  ];
  List<String> language = [
    "English",
    "Bangla",
    "Hindi",
    "Spanish"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Create New Event"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Event",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333)
          ),),
          SizedBox(height: 16,),
          CustomDropdownCheckbox(
              title: "Type",
              options: type,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Image.asset('assets/image/type.png',
                height: 24,
                width: 24,),
              onChanged: (val){

              }),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text("Upload Photo or Banner",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 12,),

                Stack(
                  alignment: Alignment.center,
                  children: [

                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(4)
                      ),
                    ),
                    Positioned(
                      child: SvgPicture.asset('assets/icons/upload.svg'),
                    )
                  ],
                )
                
              ]
            ),
          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/right.svg'),
                    SizedBox(width: 12,),
                    Text("Event Title",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                  ],
                ),
                SizedBox(height: 12,),
                CustomTextField(controller: eventTitleController,
                hintText: "Write here",)
              ],
            ),


          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/right.svg'),
                    SizedBox(width: 12,),
                    Text("Event Description",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                  ],
                ),
                SizedBox(height: 12,),
                CustomTextField(controller: eventTitleController,
                  maxLines: 5,
                  hintText: "Write here",)
              ],
            ),


          ),
          SizedBox(height: 12,),
          CustomTextField(controller: eventTitleController,
            filColor: Colors.white,
            hintText: 'Date',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/calender_fill.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/icons/calender.svg'),
            ),),

          SizedBox(height: 12,),
          CustomTextField(controller: eventTitleController,
            filColor: Colors.white,
            hintText: 'Event Time',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/clock.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset('assets/icons/calender.svg'),
            ),),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Location",
              showCheckbox: false,
              bgColor: Color(0xFFFFFFFF),
              options: location,
              leadingIcon: SvgPicture.asset('assets/icons/hekabeka_location.svg'),
              onChanged: (val){

              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Pace Selection",
              showCheckbox: false,
              options: pace,
              bgColor: Colors.white,
              leadingIcon: SvgPicture.asset('assets/icons/pace.svg'),
              onChanged: (val){

              }),
          SizedBox(height: 12,),
          CustomTextField(controller: eventTitleController,
          hintText: 'Participants',
          filColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/icons/group_type.svg'),
          ),),
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

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF0957AA),
                          width: 0.5)
                  ),
                  child: Center(
                    child: Text("Clear",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF084F9B)
                    ),),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: CustomButton(onTap: (){},
                    text: "Save Now"),
              )
            ],
          )
        ],
      ),
    );
  }
}


