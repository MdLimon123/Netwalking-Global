import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  List<String> location = [
    "Current Location",
    "Within 2 KM",
    "Within 5 KM",
    "Within 10 KM"

  ];

  List<String> distance = [
    "Within 2 KM",
    "Within 5 KM",
    "Within 10 KM"
  ];

  List<String> time = [
    "Morning",
    "Afternoon",
    "Evening"
  ];

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
  
  List<String> gender = [
    "Male",
    "Female"
  ];

  List<String> accessibility = [
    "Slow / Leisurely",
    "Medium / Conversational",
    "Fast / Brisk",
    "Mixed / Adjustable"
  ];

  List<String> language = [
    "English",
    "Bangla",
    "Hindi",
    "Spanish"
  ];

  List<String> cost=[
    "Free",
    "Paid",
    "Donation-based"
  ];

  List<String> groupType = [
    "Open to All",
    "Invite-Only",
    "Newcomers Welcome",
    "Mentor-Guided"
  ];

  List<String> host = [
    "With Certified Coach",
    "Peer-led",
    "No Coach"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Filter'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 52,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF094EBE),
                      Color(0xFF15AABA)
                    ]
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/close.svg'),
                  Text('Customize By Filter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),),
                  SvgPicture.asset('assets/icons/right_tick.svg'),
                ],
              )),
            SizedBox(height: 20,),
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
                title: "Distance",
                showCheckbox: false,
                bgColor: Color(0xFFFFFFFF),
                options: distance,
                leadingIcon: SvgPicture.asset('assets/icons/hekabeka_location.svg'),
                onChanged: (val){
                }),
            SizedBox(height: 12,),
            
            CustomTextField(controller: dateController,
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
            CustomTextField(controller: timeController,
              filColor: Colors.white,
              hintText: 'Event Time',
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/clock.svg'),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset('assets/icons/calender.svg'),
              ),),
            SizedBox(height: 12,),
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
            CustomDropdownCheckbox(
                title: "Gender",
                options: gender,
                showCheckbox: false,
                bgColor: Colors.white,
                leadingIcon: SvgPicture.asset('assets/icons/gender.svg'),
                onChanged: (val){
                }),
            SizedBox(height: 12,),
            CustomDropdownCheckbox(
                title: " Accessibility",
                showCheckbox: false,
                options: accessibility,
                bgColor: Colors.white,
                leadingIcon: SvgPicture.asset('assets/icons/accessibility.svg',
                height: 24,
                width: 24,),
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
                title: "Cost",
                options: cost,
                bgColor: Colors.white,
                showCheckbox: false,
                leadingIcon: SvgPicture.asset('assets/icons/cost.svg',
                  height: 24,
                  width: 24,),
                onChanged: (val){
                }),
            SizedBox(height: 12,),
            CustomDropdownCheckbox(
                title: "Group Type",
                options: groupType,
                bgColor: Colors.white,
                showCheckbox: false,
                leadingIcon: SvgPicture.asset('assets/icons/group_type.svg',
                  height: 24,
                  width: 24,),
                onChanged: (val){
                }),

            SizedBox(height: 12,),
            CustomDropdownCheckbox(
                title: "Coach / Host",
                options: host,
                bgColor: Colors.white,
                showCheckbox: false,
                leadingIcon: SvgPicture.asset('assets/icons/host.svg',
                  height: 24,
                  width: 24,),
                onChanged: (val){
                }),

            SizedBox(height: 32,),
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
                SizedBox(width: 12,),
                Expanded(child: CustomButton(onTap: (){},
                    text: 'Apply'))
              ],
            )

          ]
        )),
    );
  }
}
