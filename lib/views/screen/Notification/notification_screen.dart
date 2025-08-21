import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Notification"),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (context, index){
            return Row(
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
                SizedBox(width: 12,),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2h ago",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF00B35F)
                        ),),
                        SizedBox(height: 5,),
                        Text("Fatema invited you to join a group",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                        ),)
                        
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (__, index)=> SizedBox(height: 12,),
          itemCount: 10),
    );
  }
}
