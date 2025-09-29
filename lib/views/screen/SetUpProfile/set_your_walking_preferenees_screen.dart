import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/setup_profile_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';

class SetYourWalkingPrefereneesScreen extends StatefulWidget {
  const SetYourWalkingPrefereneesScreen({super.key});

  @override
  State<SetYourWalkingPrefereneesScreen> createState() => _SetYourWalkingPrefereneesScreenState();
}

class _SetYourWalkingPrefereneesScreenState extends State<SetYourWalkingPrefereneesScreen> {


  List<String> availability = [
    "Morning",
    "Afternoon",
    "Dyslexic",
    "Evening",
  ];
  final _setupProfileController = Get.put(SetupProfileController());

  List<String> distance = [
     '1 -3 KM',
    '3 - 5 KM',
    '5 - 10 KM',
    '10 - 15 KM',
    '15 - 20 KM',
  ];
  List<String> pace = [
    'Slow',
    'Moderate',
    'Fast',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              width: double.infinity,
              color: Color(0xFFE6EEF7),
              child: Column(
                children: [
                  Text("3 Of 3",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontSize: 16
                    ),),
                  SizedBox(height: 20,),
                  SvgPicture.asset('assets/icons/walk.svg'),
                  SizedBox(height: 20,),
                  Center(
                    child: Text("Set Your Walking Preferences",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                          fontSize: 32
                      ),
                    textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 8,),
                  Center(
                    child: Text("Choose how you like to walk and what you're looking for",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                      textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child:Column(
                children: [

                 CustomDropdownCheckbox(
                        title: "Availability",
                        showCheckbox: false,
                        options: availability,
                        leadingIcon: SvgPicture.asset('assets/icons/sun.svg'),
                        onChanged: (val){
                          if (val.isNotEmpty) {
                            _setupProfileController.walkingAvailability.value = val.first;

                          }

                        }),

                  SizedBox(height: 16,),
                 CustomDropdownCheckbox(
                        title: "Walking Distance",
                        showCheckbox: false,
                        options: distance,
                        leadingIcon: SvgPicture.asset('assets/icons/distance.svg'),
                        onChanged: (val){
                          if (val.isNotEmpty) {
                            _setupProfileController.walkingDistance.value = val.first;
                          }
                        }),
                  SizedBox(height: 16,),
                CustomDropdownCheckbox(
                        title: "Pace Selection",
                        showCheckbox: false,
                        options: pace,
                        leadingIcon: SvgPicture.asset('assets/icons/pace.svg'),
                        onChanged: (val){
                          if (val.isNotEmpty) {
                            _setupProfileController.paceSelection.value = val.first;
                          }
                        }),


                  SizedBox(height: 102,),
                  Obx(
                     ()=> CustomButton(
                      loading: _setupProfileController.isWalkingLoading.value,
                        onTap: (){
                     _setupProfileController.submitWalkingPreferences();
                    },
                        text: "Continue"),
                  )
                ],
              ),
            )

          ])
      ),
    );
  }
}
