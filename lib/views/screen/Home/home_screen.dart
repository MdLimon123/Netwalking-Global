import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/find_a_coach_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindWalkPartner/find_walk_partner_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/joint_event_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/search_screen.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/image/splashIcon.png',
            height: 32,
            width: 30,),
            SizedBox(width: 8,),
            Text("Net walking Global",
            style: TextStyle(
              color: Color(0xFF0F52BA),
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),),
            Spacer(),
            InkWell(
              onTap: (){
                Get.to(()=> NotificationScreen());
              },
                child: SvgPicture.asset('assets/icons/notification.svg'))
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
                controller: searchController,
              onTap: (){
                  Get.to(()=> SearchScreen());
              },
              hintText: 'Search walk partner or events...',
              filColor: Colors.white,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/filter.svg'),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              )
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Get.to(()=> JointEventScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCC6F36),
                      Color(0xFFD7BA18)
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/join.svg'),
                    SizedBox(height: 8,),
                    Text("Joint Event",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Get.to(()=> FindACoachScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF005ECA),
                            Color(0xFFB737F2),

                          ]
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/coach.svg'),
                          SizedBox(height: 8,),
                          Text("Coach",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Get.to(()=> FindWalkPartnerScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF094EBE),
                                Color(0xFF15AABA),

                              ]
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/parten_walk.svg'),
                          SizedBox(height: 8,),
                          Text("Find Walk Partner",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text("Community",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 12,),
           ListView.separated(
             shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context, index){
                 return  Container(
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
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             height: 28,
                             width: 28,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                     fit: BoxFit.cover)
                             ),
                           ),
                           SizedBox(width: 8,),
                           Text("Mr. John",
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: Color(0xFF545454)
                             ),),
                           SizedBox(width: 8,),
                           Icon(Icons.access_time,
                             color: Color(0xFF545454),
                             size: 16,),
                           SizedBox(width: 4,),
                           Text("8.00 AM",
                             style: TextStyle(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400,
                                 color: Color(0xFF545454)
                             ),),
                           SizedBox(width: 70,),
                           Container(
                             width: 60,
                             height: 40,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(12),
                                 image: DecorationImage(image: AssetImage('assets/image/dummy.jpg'),
                                     fit: BoxFit.cover)
                             ),
                           )
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 25),
                         child: Text("Clean Up Walk Dhanmondi",
                           style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w600,
                               color: AppColors.textColor
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
                         child: Row(
                           children: [
                             Icon(Icons.favorite_border,
                               color: Color(0xFF545454),
                               size: 16,),
                             SizedBox(width: 2,),
                             Text('25',
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.textColor
                               ),),
                             SizedBox(width: 32,),
                             SvgPicture.asset('assets/icons/comment.svg'),
                             SizedBox(width: 2,),
                             Text('25',
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.textColor
                               ),),
                             Spacer(),
                             Text("Details",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.textColor,
                                   decoration: TextDecoration.underline
                               ),

                             ),

                           ],
                         ),
                       )
                     ],
                   ),
                 );
               },
               separatorBuilder: (__, index) => SizedBox(height: 8),
               itemCount: 2),
            SizedBox(height: 20,),
            Text("Suggested Matches",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor

            ),),
            SizedBox(height: 12,),
            SizedBox(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      width: 180,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(image: AssetImage('assets/image/dummy.jpg'),
                                    fit: BoxFit.cover)
                            ),
                          ),
                          SizedBox(height: 8,),
                          Center(
                            child: Text("Sophia, 28",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor
                              ),),
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child:Text("Student",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                              ),),
                          ),
                          SizedBox(height: 16,),
                          Center(
                            child: Container(
                              height: 44,
                              width: 134,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE8F2ED),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                              child: Center(child: Text("Invite To Walk",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor
                                ),)),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (__, index)=> SizedBox(width: 12,),
                  itemCount: 5),
            ),
            SizedBox(height: 20,),
            Text("Upcoming Event’s & Walk",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 12,),
           ListView.separated(
             shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context, index){
                 return  Container(
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
                             Text("Message Now",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w400,
                                   color: AppColors.textColor,
                                   decoration: TextDecoration.underline
                               ),)
                           ],
                         )


                       ],
                     )
                 );
               },
               separatorBuilder: (__, index)=> SizedBox(height: 8,),
               itemCount: 2)

          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(0),
    );
  }
}
