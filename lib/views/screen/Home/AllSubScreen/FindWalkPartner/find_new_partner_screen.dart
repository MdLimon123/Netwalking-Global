import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/user_profile_screen.dart';

class FindNewPartnerScreen extends StatefulWidget {
  const FindNewPartnerScreen({super.key});

  @override
  State<FindNewPartnerScreen> createState() => _FindNewPartnerScreenState();
}

class _FindNewPartnerScreenState extends State<FindNewPartnerScreen> {

  final locationController = TextEditingController();

  List<String> distance = [
    "Distance",
    "Within 2 KM",
    "Within 5 KM",
    "Within 10 KM"

  ];

  List<String> cost=[
    "Free",
    "Paid",
    "Donation-based"
  ];

  List<String> type =[
    "No",
    "Yes"
  ];

  List<String> availability = [
    "Morning",
    "Afternoon",
    "Dyslexic",
    "Evening",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Find New Partner"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Partner",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 8,),
            Text("Select your goal—wellbeing, connection, or focus—to match with like-minded walking partners.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
            ),),
            SizedBox(height: 16,),
            CustomTextField(controller: locationController,
            hintText: 'Location',
            filColor: Colors.white,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/location_fill.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset('assets/icons/location.svg'),
            ),),
            SizedBox(height: 16,),

            CustomDropdownCheckbox(
                title: "Distance",
                showCheckbox: false,
                bgColor: Color(0xFFFFFFFF),
                options: distance,
                leadingIcon: SvgPicture.asset('assets/icons/hekabeka_location.svg'),
                onChanged: (val){

                }),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownCheckbox(
                      title: "Cost",
                      options: cost,
                      bgColor: Colors.white,
                      showCheckbox: false,
                      leadingIcon: SvgPicture.asset('assets/icons/cost.svg',
                        height: 24,
                        width: 24,),
                      onChanged: (val){
                      }),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: CustomDropdownCheckbox(
                      title: "Type",
                      showCheckbox: false,
                      bgColor: Color(0xFFFFFFFF),
                      options: type,
                      leadingIcon: SvgPicture.asset('assets/icons/single_person.svg'),
                      onChanged: (val){
                  
                      }),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  child:   CustomDropdownCheckbox(
                      title: "Availability",
                      showCheckbox: false,
                      options: availability,
                      bgColor: Colors.white,
                      leadingIcon: SvgPicture.asset('assets/icons/morning.svg'),
                      onChanged: (val){

                      }),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: CustomTextField(controller: locationController,
                  filColor: Colors.white,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/calender_fill.svg'),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset('assets/icons/calender.svg'),
                  ),
                  hintText: '25 Feb 25',),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Text("Walk Partner Recommendations",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor

            ),),
            SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
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

                          Row(
                            children: [
                              Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                          fit: BoxFit.cover)

                                  )),
                              SizedBox(width: 8,),
                              Text("0.8 Km away",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor
                                ),),

                            ],
                          ),
                          SizedBox(height: 6,),

                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text("Mike Rodriguez",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF545454)
                              ),),
                          ),


                          SizedBox(height: 6,),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Text("Student",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor
                                  ),),

                                Spacer(),

                                InkWell(
                                  onTap: (){
                                    Get.to(()=> UserProfileScreen());
                                  },
                                  child: Text("See Profile",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.textColor,
                                    color: AppColors.textColor
                                  ),),
                                ),
                                SizedBox(width: 16,),
                                Container(
                                  width: 60,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFFE8F2ED)
                                  ),
                                  child: Center(
                                    child: Text("Accept",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF545454)
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );

                  },
                  separatorBuilder: (__, index)=> SizedBox(height: 8),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
