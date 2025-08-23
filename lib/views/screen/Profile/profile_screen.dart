import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/edit_profile_screen.dart';

import '../../base/bottom_menu..dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:  AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Text("Profile",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
        ),),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                Get.to(()=> NotificationScreen());
              },
              child: SvgPicture.asset('assets/icons/notification.svg')),
          SizedBox(width: 10,)
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
                        Get.to(()=> EditProfileScreen());
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFE6EEF7), width: 1),
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

                // Profile Image
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),

                 SizedBox(height: 8),

                // Name
                Text(
                  "Sophia Carter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                  ),
                ),

                const SizedBox(height: 4),

                // Role
                Text(
                  "Wellness Enthusiast",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF545454),
                  ),
                ),

                const SizedBox(height: 4),

                // Email
                Text(
                  "SophiaCarter123@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0957AA)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text("I love mindful walks, reading relationship psychology books, and connecting with people who believe in emotional growth",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor
              ),),
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _customContainer(
                  count: '10',
                  text: 'Events'
                ),
                SizedBox(width: 10,),
                _customContainer(
                    count: '25',
                    text: 'Walks'
                ),
                SizedBox(width: 10,),
                _customContainer(
                    count: '200',
                    text: 'Day Streak'
                ),


              ],
            ),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      SizedBox(width: 13,),
                      Text("Push Notification",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 90,),
                      CustomSwitch(
                          value: isSwitch,
                          onChanged: (val){
                            setState(() {
                              isSwitch = val;
                            });
                          }),

                    ],
                  ),
                  SizedBox(height: 16,),
                  _customRow(
                    image: 'assets/icons/lock.svg',
                    text: 'Change Password',
                    onTa: (){}
                  ),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/change_language.svg',
                      text: 'Change Language',
                      onTa: (){}
                  ),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/subcriptions.svg',
                      text: 'Manage Subscription',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/delete.svg',
                      text: 'Delete my account',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/report.svg',
                      text: 'Report a Problem',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/terms.svg',
                      text: 'Terms of service',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/privacy.svg',
                      text: 'Privacy Policy',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  _customRow(
                      image: 'assets/icons/about.svg',
                      text: 'About us',
                      onTa: (){}),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/logout.svg'),
                      SizedBox(width: 13,),
                      Text('Logout',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF04B4C)
                        ),),

                    ],
                  )



                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomMenu(3),
    );
  }

   _customRow({
     required String image,
     required String text,
     required Function()? onTa
   }) {
    return InkWell(
      onTap: onTa,
      child: Row(
                    children: [
                      SvgPicture.asset(image),
                      SizedBox(width: 13,),
                      Text(text,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg',
                      color: Color(0xFF000000),),
                    ],
                  ),
    );
  }

   _customContainer({required String count, required String text}) {
    return Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(count,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F171A)
                    ),),
                    Text(text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                    ),)
                  ],
                )
              ),
            );
  }
}
