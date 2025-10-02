import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_patner_walk_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';

class UserProfileScreen extends StatefulWidget {

  final int id;

  const UserProfileScreen({super.key, required this.id});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  final _findPartnerWalkController = Get.put(FindPartnerWalkController());



  @override
  void initState() {
    _findPartnerWalkController.fetchSingleUserProfile(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:  AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Obx(
          ()=> Text(_findPartnerWalkController.name.value,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),),
        ),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: Color(0xFF0D1C12),
            size: 18,),
        ),
        actions: [
          InkWell(
              onTap: (){
                Get.to(()=> NotificationScreen());
              },
              child: SvgPicture.asset('assets/icons/notification.svg')),
          SizedBox(width: 10,)
        ],
      ),
      body: Obx(()=> _findPartnerWalkController.isSingleUserProfileLoading.value?
      Center(child: CustomPageLoading()):
      ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 17),
          itemCount: _findPartnerWalkController.singleUserProfileList.length,
          itemBuilder:(context, index) {
            final data = _findPartnerWalkController.singleUserProfileList[index];
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      CustomNetworkImage(
                          imageUrl: data.image,
                          boxShape: BoxShape.circle,
                          height: 60,
                          width: 60),


                      SizedBox(height: 8),
                      Text(
                        data.fullName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.profession,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF545454),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.email,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0957AA)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      data.bio,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _customContainer(count: data.totalEventJoin.toString(), text: 'Events'),
                      SizedBox(width: 10),
                      _customContainer(count: data.totalWalk.toString(), text: 'Walks'),
                      SizedBox(width: 10),
                      _customContainer(count: data.totalDayStreak.toString(), text: 'Day Streak'),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location.svg'),
                            SizedBox(width: 13),
                            Text(data.location,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor)),
                          ],
                        ),
                        SizedBox(height: 16),
                        _customRow(
                            image: 'assets/icons/right.svg', text: data.profession),
                        SizedBox(height: 16),
                        _customRow(
                            image: 'assets/icons/people.svg', text: data.age.toString()),
                        SizedBox(height: 16),
                        _customRow(
                            image: 'assets/icons/key.svg', text: data.gender),
                        SizedBox(height: 16),
                        _customRow(image: 'assets/icons/ethicity.svg',
                            text: data.ethnicity),
                        SizedBox(height: 16),
                        _customRow(
                            image: 'assets/icons/add_more.svg',
                            text: data.sexualOrientation),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                )
              ],
            );
          })));
  }

 Widget _customRow({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 13),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
        ),
      ],
    );
  }

 Widget _customContainer({required String count, required String text}) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                count,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F171A)),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor),
              )
            ],
          )),
    );
  }
}
