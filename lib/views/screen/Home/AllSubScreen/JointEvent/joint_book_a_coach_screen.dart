import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/morning_walk_screen.dart';

class JointBookACoachScreen extends StatefulWidget {
  const JointBookACoachScreen({super.key});

  @override
  State<JointBookACoachScreen> createState() => _JointBookACoachScreenState();
}

class _JointBookACoachScreenState extends State<JointBookACoachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Get.to(() => MorningWalkScreen());
              },
              text: 'start_now'.tr, // localization
            ),
            SizedBox(height: 116),
            CustomButton(
              onTap: () {},
              text: 'mark_as_completed'.tr, // localization
            ),
            SizedBox(height: 22),
            CustomButton(
              onTap: () {},
              text: 'delete'.tr, // localization
            )
          ],
        ),
      ),
    );
  }
}
