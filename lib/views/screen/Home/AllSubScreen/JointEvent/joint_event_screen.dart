import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/event_details_screen.dart';

class JointEventScreen extends StatefulWidget {
  const JointEventScreen({super.key});

  @override
  State<JointEventScreen> createState() => _JointEventScreenState();
}

class _JointEventScreenState extends State<JointEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Joint a Event"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Event List",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 20,),
            Expanded(
              child:   ListView.separated(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return  InkWell(
                      onTap: (){
                        Get.to(()=> EventDetailsScreen());
                      },
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
                                    ),
                                    child: SvgPicture.asset('assets/icons/show.svg',
                                      fit: BoxFit.cover,),
                                  ),
                                  SizedBox(width: 8,),
                                  Text("Morning Walking",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textColor
                                    ),)
                                ],
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Text("Today: 8.00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor
                                  ),),
                              ),
                              SizedBox(height: 8,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "With group",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  SizedBox(
                                    height: 32,
                                    width: 90, //
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        // 1st avatar
                                        Positioned(
                                          left: 0,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage("assets/image/profile.jpg"),
                                          ),
                                        ),

                                        // 2nd avatar (overlap)
                                        Positioned(
                                          left: 20,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundImage: AssetImage("assets/image/profile.jpg"),
                                          ),
                                        ),

                                        // Badge (12+)
                                        Positioned(
                                          left: 40,
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE59A2F), // গোল্ডেন ব্যাকগ্রাউন্ড
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 2), // border যেন সুন্দর লাগে
                                            ),
                                            child: Center(
                                              child: Text(
                                                "12+",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Spacer(),
                                  Text("Completed",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF366B2D),
                                    ),)
                                ],
                              )


                            ],
                          )
                      ),
                    );
                  },
                  separatorBuilder: (__, index)=> SizedBox(height: 8,),
                  itemCount: 20),
            ),


          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(onTap: (){},
            text: "Create New Event"),
      ),
    );
  }
}
