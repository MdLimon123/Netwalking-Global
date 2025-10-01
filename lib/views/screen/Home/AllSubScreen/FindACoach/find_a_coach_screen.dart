import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_book_coach_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';
import 'package:netwalking_global/views/base/formate_even_time.dart';
import 'package:netwalking_global/views/base/time_date.dart';
import 'package:netwalking_global/views/screen/Coach/start_coach_profile_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/book_a_coach_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/coach_profile_details.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/find_new_coach_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/session_booking_details_screen.dart';

class FindACoachScreen extends StatefulWidget {
  const FindACoachScreen({super.key});

  @override
  State<FindACoachScreen> createState() => _FindACoachScreenState();
}

class _FindACoachScreenState extends State<FindACoachScreen> {

   bool isSwitched = false;

   final _findBookingCoachController = Get.put(FindBookCoachController());

   @override
  void initState() {
    _findBookingCoachController.fetchFindBookingCoach();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Find a Coach"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Recent",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                ),),
                Spacer(),
                Text("As a Coach",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
                SizedBox(width: 8,),
                CustomSwitch(
                    value: isSwitched,
                    onChanged: (val){
                      setState(() {
                        isSwitched = val;
                      });
                      if(val == true){
                        Get.to(()=> StartCoachProfileScreen(), transition: Transition.noTransition);
                      }

                    })
              ],
            ),
            SizedBox(height: 16,),
            Obx(()=> _findBookingCoachController.isFindCoachLoading.value ?
            Center(child: CustomPageLoading(),) :
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    final coach = _findBookingCoachController.findBookingCoachList[index];
                    return InkWell(
                      onTap: (){
                        /// session details screen
                        Get.to(()=> SessionBookingDetailsScreen(
                          id: coach.bookingId,
                        ));
                      },
                      child: Container(
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

                                CustomNetworkImage(
                                    imageUrl: coach.coachImage,
                                    boxShape: BoxShape.circle,
                                    height: 24,
                                    width: 24),

                                SizedBox(width: 8,),
                                Text(coach.coachName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor
                                  ),)
                              ],
                            ),
                            SizedBox(height: 6,),
                            Row(
                              children: [
                                Text("Specialty: ${coach.coachingAreaName}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF545454)
                                  ),),
                                Spacer(),
                                Text(coach.status,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF468A3A)
                                  ),)
                              ],
                            ),
                            SizedBox(height: 6,),
                            Text("${customTimeDateEvent(coach.sessionDate)} ${customTimeDateEvent(coach.sessionTime)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                              ),)
                          ],
                        ),
                      ),
                    );

                  },
                  separatorBuilder: (_, index)=> SizedBox(height: 8),
                  itemCount: _findBookingCoachController.findBookingCoachList.length),
            ),),
            CustomButton(onTap: (){
              Get.to(()=> FindNewCoachScreen());
            },
                text: "Find New Coach")
          ],
        ),
      ),
    );
  }
}
