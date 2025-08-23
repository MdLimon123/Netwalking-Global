import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';
import 'package:netwalking_global/views/screen/Chat/chat_screen.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Text("Chat",style: TextStyle(
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
      body: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Get.to(()=> ChatScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                  fit: BoxFit.cover)
                          ),

                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Darlene Steward",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                SizedBox(width: 95,),
                                Text(' 08:09 PM',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),)
                              ],
                            ),
                            SizedBox(height: 4,),
                            Text("Pls take a look at the images.",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (__,___)=> SizedBox(height: 8,),
          itemCount: 10),
      bottomNavigationBar: BottomMenu(2),
    );
  }
}
