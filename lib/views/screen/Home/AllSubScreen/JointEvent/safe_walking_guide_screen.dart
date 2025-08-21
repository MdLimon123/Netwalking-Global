import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class SafeWalkingGuideScreen extends StatefulWidget {
  const SafeWalkingGuideScreen({super.key});

  @override
  State<SafeWalkingGuideScreen> createState() => _SafeWalkingGuideScreenState();
}

class _SafeWalkingGuideScreenState extends State<SafeWalkingGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Safe Walking Guidelines"),
      body: ListView(
        padding: EdgeInsets.only(top: 8),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _headingText(
                  text: 'Plan Your Route'
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                  subText: 'Always choose safe, well-lit, and familiar routes..'
                ),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Stay Visible '
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                    subText: 'Wear bright or reflective clothing, especially if walking at night..'
                ),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Be Alert'
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                    subText: 'Keep your phone’s volume low or use one earbud so you can hear your surroundings.'
                ),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Walk in Groups'
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                    subText: 'Whenever possible, join a walk with other members for extra safety'
                ),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Carry Essentials'
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                    subText: 'Bring water, ID, and a small first-aid kit.'
                ),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Follow Traffic Rules'
                ),
                SizedBox(height: 8,),
                _subHeadingText(
                    subText: 'Cross streets at pedestrian crossings and obey signals'
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }

   _subHeadingText({required String subText}) {
    return Text(subText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF696767)
              ),);
  }

   _headingText({required String text}) {
    return Text(text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF042547)
              ),);
  }
}
