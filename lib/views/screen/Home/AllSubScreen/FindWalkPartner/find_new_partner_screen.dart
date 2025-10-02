import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:netwalking_global/controllers/find_patner_walk_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindWalkPartner/find_partner_walk_filter_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/user_profile_screen.dart';

class FindNewPartnerScreen extends StatefulWidget {
  const FindNewPartnerScreen({super.key});

  @override
  State<FindNewPartnerScreen> createState() => _FindNewPartnerScreenState();
}

class _FindNewPartnerScreenState extends State<FindNewPartnerScreen> {

  final _findPartnerWalkController = Get.put(FindPartnerWalkController());

  final locationController = TextEditingController();
  final dateController = TextEditingController();

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




  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
    }
  }

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
                  _findPartnerWalkController.selectedDistance.value = val.first;
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
                        _findPartnerWalkController.selectedCost.value = val.first;
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
                        _findPartnerWalkController.selectedType.value = val.first;
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
                        _findPartnerWalkController.selectedAvailability.value = val.first;
                      }),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: CustomTextField(controller: dateController,
                  filColor: Colors.white,
                  readOnly: true,
                  onTap: (){
                    pickDate();
                  },
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

            SizedBox(height: 160,),


            CustomButton(onTap: (){
              _findPartnerWalkController.fetchSearchForPartnerWalk();
              Get.to(()=> FindPartnerWalkFilterScreen());
            },
                text: "Apply Now"),


          ],
        ),
      ),
    );
  }
}
