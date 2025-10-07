import 'package:flutter/material.dart';
import 'package:netwalking_global/controllers/coach_profile_setup_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';
import 'package:netwalking_global/views/screen/Coach/session_details_screen.dart';

class CoachViewAllUsersScreen extends StatefulWidget {
  const CoachViewAllUsersScreen({super.key});

  @override
  State<CoachViewAllUsersScreen> createState() => _CoachViewAllUsersScreenState();
}

class _CoachViewAllUsersScreenState extends State<CoachViewAllUsersScreen> {

  final _coachProfileSetupProfile = Get.put(CoachProfileSetupProfile());

  @override
  void initState() {
    _coachProfileSetupProfile.fetchBookingAllUser();
    _coachProfileSetupProfile.fetchUpcomingSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'coach'.tr),
      body: Obx(
          ()=> _coachProfileSetupProfile.isBookingLoading.value?
              Center(child: CustomPageLoading()): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Request",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "as_a_coach".tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomSwitch(
                      value: true,
                      onChanged: (val) {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = _coachProfileSetupProfile.bookingAllUser[index];
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                             CustomNetworkImage(
                                 imageUrl: item.userImage,
                                 height: 24,
                                 boxShape: BoxShape.circle,
                                 width: 24),
                              Padding(
                                padding: EdgeInsets.only(left: 6.0),
                                child: Text(
                                  item.userName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF545454),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  _coachProfileSetupProfile.declineBooking(id: item.bookingId);
                                },
                                child: Container(
                                  width: 60,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: const Color(0xFFE6EEF7)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "decline".tr,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF545454),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                           Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              customTimeDateEvent(item.sessionDate),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF545454),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Text(
                                 customTimeDateEvent(item.sessionTime) ,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    _coachProfileSetupProfile.acceptBooking(id: item.bookingId);
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: const Color(0xFFE8F2ED)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "accept".tr,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF545454),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 8),
                  itemCount: _coachProfileSetupProfile.bookingAllUser.length,
                ),

                Text(
                  "Upcoming Sessions",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = _coachProfileSetupProfile.upcomingSessionList[index];
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                              CustomNetworkImage(
                                  imageUrl: item.userImage,
                                  height: 24,
                                  boxShape: BoxShape.circle,
                                  width: 24),
                              Padding(
                                padding: EdgeInsets.only(left: 6.0),
                                child: Text(
                                  item.userName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF545454),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  Get.to(()=> SessionDetailsScreen(
                                    id: item.bookingId,
                                  ));
                                },
                                child: Container(
                                  width: 103,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFCC6F36),
                                        Color(0xFFD7BA18),
                                      ]
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(11),
                                      bottomRight: Radius.circular(11)
                                    ),
                                    border: Border.all(color: const Color(0xFFE6EEF7)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Sessions",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              customTimeDateEvent(item.sessionDate),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF545454),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  customTimeDateEvent(item.sessionTime) ,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 103,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: const Color(0xFFE6E7EA)),

                                  ),
                                  child: Center(
                                    child: Text(
                                      "Message",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF545454),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 8),
                  itemCount: _coachProfileSetupProfile.upcomingSessionList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
