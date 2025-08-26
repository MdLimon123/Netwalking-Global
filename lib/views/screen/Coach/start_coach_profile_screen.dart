import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/screen/SetUpProfile/set_up_coach_profile_screen.dart';

class StartCoachProfileScreen extends StatefulWidget {
  const StartCoachProfileScreen({super.key});

  @override
  State<StartCoachProfileScreen> createState() => _StartCoachProfileScreenState();
}

class _StartCoachProfileScreenState extends State<StartCoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'coach'.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "as_a_coach".tr,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(width: 8),
              CustomSwitch(
                value: true,
                onChanged: (val) {},
              )
            ],
          ),
          const SizedBox(height: 100),
          Center(
            child: Text(
              "oops".tr,
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w600,
                color: Color(0xFF329983),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "oops_description".tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 75),
          CustomButton(
            onTap: () {
              Get.to(() => const SetUpCoachProfileScreen());
            },
            text: "start_profile_setup".tr,
          )
        ],
      ),
    );
  }
}
