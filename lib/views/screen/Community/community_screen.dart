import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/screen/Community/AllSubScreen/community_details_screen.dart';
import 'package:netwalking_global/views/screen/Community/AllSubScreen/create_post_screen.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';


class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
       appBar:  AppBar(
          backgroundColor:Colors.white,
          elevation: 0,
          title: Text("Community",style: TextStyle(
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _customCategories(textKey: "Biodiversity Awareness"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Eco-Conscious Living"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Projects"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Resilience Hubs"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Skill Sharing"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Professional Growth"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Professional Networking"),
                  SizedBox(width: 8),
                  _customCategories(textKey: "Wellness")
                ],
              ),
            ),
            SizedBox(height: 26,),

          Expanded(
              child:   ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Get.to(()=> CommunityDetailsScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFE6E6E6), width: 1)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 8,),

                            Text("Mr.John",
                              style: TextStyle(
                                color: Color(0xFF545454),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 14,),
                            SvgPicture.asset('assets/icons/clock.svg'),
                            SizedBox(width: 4,),
                            Text("8:00 AM",
                              style: TextStyle(
                                color: Color(0xFF545454),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Clean Up Walk - Dhanmondi",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                      fit: BoxFit.cover)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.favorite,
                              color: Colors.red,),
                            Text("25",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),),
                            SizedBox(width: 15,),
                            SvgPicture.asset('assets/icons/comment.svg'),
                            Text("25",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (__, index) => SizedBox(height: 10,),
              itemCount: 5)),

            CustomButton(onTap: (){
              Get.to(()=> CreatePostScreen());
            },
                text: "Create a Post")

          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(1),
    );
  }

  _customCategories({required String textKey}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      height: 34,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        textKey,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}


