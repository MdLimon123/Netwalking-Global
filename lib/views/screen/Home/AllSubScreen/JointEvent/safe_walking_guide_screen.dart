import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: CustomAppbar(title: "safe_walking_guidelines".tr),
      body: ListView(
        padding: EdgeInsets.only(top: 8),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headingText(text: 'plan_your_route'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'choose_safe_routes'.tr),
                SizedBox(height: 16),
                _headingText(text: 'stay_visible'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'wear_bright_clothing'.tr),
                SizedBox(height: 16),
                _headingText(text: 'be_alert'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'keep_phone_low_volume'.tr),
                SizedBox(height: 16),
                _headingText(text: 'walk_in_groups'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'join_walk_with_others'.tr),
                SizedBox(height: 16),
                _headingText(text: 'carry_essentials'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'bring_water_id_first_aid'.tr),
                SizedBox(height: 16),
                _headingText(text: 'follow_traffic_rules'.tr),
                SizedBox(height: 8),
                _subHeadingText(subText: 'cross_streets_at_pedestrian_crossings'.tr),
              ],
            ),
          )
        ],
      ),
    );
  }

  _subHeadingText({required String subText}) {
    return Text(
      subText,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF696767),
      ),
    );
  }

  _headingText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF042547),
      ),
    );
  }
}
