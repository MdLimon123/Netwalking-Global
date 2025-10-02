import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_patner_walk_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/screen/Profile/AllSubScreen/user_profile_screen.dart';

class FindPartnerWalkFilterScreen extends StatefulWidget {
  const FindPartnerWalkFilterScreen({super.key});

  @override
  State<FindPartnerWalkFilterScreen> createState() => _FindPartnerWalkFilterScreenState();
}

class _FindPartnerWalkFilterScreenState extends State<FindPartnerWalkFilterScreen> {

  final _findPartnerWalkController = Get.put(FindPartnerWalkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Find Walk Partner'),
      body:Obx(()=> _findPartnerWalkController.isSearchForPartnerWalkLoading.value?
      Center(child: CustomPageLoading()):
      ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemBuilder: (context, index){
          final data = _findPartnerWalkController.searchForPartnerWalkList[index];
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

                    CustomNetworkImage(
                        imageUrl: data.image,
                        height: 24,
                        boxShape: BoxShape.circle,
                        width: 24),

                    SizedBox(width: 8,),
                    Text(data.wakingDistance,
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
                  child: Text(data.fullName,
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
                      Text(data.profession,
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
                          child: Text("Invite",
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
        separatorBuilder: (_, index)=> SizedBox(height: 8),
        itemCount: _findPartnerWalkController.searchForPartnerWalkList.length,)),

    );
  }
}
