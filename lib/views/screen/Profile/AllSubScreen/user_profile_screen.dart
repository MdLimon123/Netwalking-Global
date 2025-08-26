import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Sophia Carter"),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 17),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
                SizedBox(height: 8),
                Text(
                  "Sophia Carter",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor),
                ),
                const SizedBox(height: 4),
                Text(
                  "Wellness Enthusiast",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF545454),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "SophiaCarter123@gmail.com",
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text(
                "bio".tr,
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
                _customContainer(count: '10', text: 'events'.tr),
                SizedBox(width: 10),
                _customContainer(count: '25', text: 'walks'.tr),
                SizedBox(width: 10),
                _customContainer(count: '200', text: 'day_streak'.tr),
              ],
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      SizedBox(width: 13),
                      Text("badda".tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor)),
                    ],
                  ),
                  SizedBox(height: 16),
                  _customRow(image: 'assets/icons/right.svg', text: 'teacher'.tr),
                  SizedBox(height: 16),
                  _customRow(image: 'assets/icons/people.svg', text: 'age_24'.tr),
                  SizedBox(height: 16),
                  _customRow(image: 'assets/icons/key.svg', text: 'male'.tr),
                  SizedBox(height: 16),
                  _customRow(image: 'assets/icons/ethicity.svg', text: 'ethnicity'.tr),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/add_more.svg',
                      text: 'sexual_orientation'.tr),
                  SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _customRow({required String image, required String text}) {
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

  _customContainer({required String count, required String text}) {
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
