import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/services/prefs_helper.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/utils/app_constants.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/about_us_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/change_language_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/change_password_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/edit_profile_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/privace_policy_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/report_problem_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/subscription_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/terms_of_service_screen.dart';

import '../../base/bottom_menu..dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitch = false;

  final _dataController = Get.put(DataController());

  @override
  void initState() {
    _dataController.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("profile".tr,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor)),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: SvgPicture.asset('assets/icons/notification.svg')),
          SizedBox(width: 10)
        ],
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => EditProfileScreen());
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: Color(0xFFE6EEF7), width: 1),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 14,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _dataController.profileImage.value != null?  Obx(
                      ()=> CustomNetworkImage(
                    height: 50,
                    width: 50,
                    imageUrl: _dataController.profileImage.value,
                    boxShape: BoxShape.circle,
                  ),
                ):CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
                SizedBox(height: 8),
                Obx(()=>
                   Text(
                    _dataController.name.value,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor),
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  ()=> Text(
                    _dataController.profession.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF545454),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                  ()=> Text(
                    _dataController.email.value,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0957AA)),
                  ),
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
              child: Obx(
                ()=> Text(
                  _dataController.bio.value,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
                ()=> Row(
                children: [
                  _customContainer(count: _dataController.totalEventJoin.value, text: 'Events'),
                  SizedBox(width: 10),
                  _customContainer(count: _dataController.totalWalk.value, text: 'Walks'),
                  SizedBox(width: 10),
                  _customContainer(count: _dataController.totalDayStreak.value, text: 'Day Streak'),
                ],
              ),
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
                      SvgPicture.asset('assets/icons/notification.svg'),
                      SizedBox(width: 13),
                      Text(
                        "push_notification".tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor),
                      ),
                      Spacer(),
                      CustomSwitch(
                          value: isSwitch,
                          onChanged: (val) {
                            setState(() {
                              isSwitch = val;
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/lock.svg',
                      text: 'change_password'.tr,
                      onTa: () {
                        Get.to(() => ChangePasswordScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/change_language.svg',
                      text: 'change_language'.tr,
                      onTa: () {
                        Get.to(() => ChangeLanguageScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/subcriptions.svg',
                      text: 'manage_subscription'.tr,
                      onTa: () {
                        Get.to(() => SubscriptionScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/delete.svg',
                      text: 'delete_my_account'.tr,
                      onTa: () {
                        _customDeleteAccount(context, Color(0xFFC31037),
                            Color(0xFFD23317), 'Are you sure you want to delete account?');
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/report.svg',
                      text: 'report_problem'.tr,
                      onTa: () {
                        Get.to(() => ReportProblemScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/terms.svg',
                      text: 'terms_of_service'.tr,
                      onTa: () {
                        Get.to(() => TermsOfServiceScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/privacy.svg',
                      text: 'privacy_policy'.tr,
                      onTa: () {
                        Get.to(() => PrivacyPolicyScreen());
                      }),
                  SizedBox(height: 16),
                  _customRow(
                      image: 'assets/icons/about.svg',
                      text: 'about_us'.tr,
                      onTa: () {
                        Get.to(() => AboutUsScreen());
                      }),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      _customDeleteAccount(context, Color(0xFF094EBE),
                          Color(0xFF15AABA), 'Are you sure you want to logout?');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/logout.svg'),
                        SizedBox(width: 13),
                        Text(
                          'logout'.tr,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF04B4C)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomMenu(3),
    );
  }

  _customDeleteAccount(
      BuildContext context, Color startColor, Color endColor, String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [startColor, endColor])),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: ()async{
                            await PrefsHelper.remove(AppConstants.bearerToken);
                            Get.offAllNamed(AppRoutes.splashScreen);
                          },
                          child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                  Border.all(color: Color(0xFFFFFFFF), width: 1)),
                              child: Center(
                                child: Text(
                                  "yes".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "no".tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _customRow(
      {required String image, required String text, required Function()? onTa}) {
    return InkWell(
      onTap: onTa,
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 13),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/arrow_right.svg',
            color: Color(0xFF000000),
          ),
        ],
      ),
    );
  }

  _customContainer({required int count, required String text}) {
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
                count.toString(),
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
