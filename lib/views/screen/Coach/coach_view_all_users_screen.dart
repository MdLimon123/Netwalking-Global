import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:get/get.dart';

class CoachViewAllUsersScreen extends StatefulWidget {
  const CoachViewAllUsersScreen({super.key});

  @override
  State<CoachViewAllUsersScreen> createState() => _CoachViewAllUsersScreenState();
}

class _CoachViewAllUsersScreenState extends State<CoachViewAllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'coach'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "recent".tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                const Spacer(),
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
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/image/profile.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "away_distance".trParams({"km": "0.8"}),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 60,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: const Color(0xFFE6EEF7)),
                              ),
                              child: Center(
                                child: Text(
                                  "decline".tr,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF545454),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Mike Rodriguez", // 👈 ডায়নামিক হলে এটাও json থেকে আনতে পারো
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF545454),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              Text(
                                "today_time".trParams({"time": "8.00"}),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 60,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: const Color(0xFFE8F2ED)),
                                ),
                                child: Center(
                                  child: Text(
                                    "accept".tr,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF545454),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (__, index) => const SizedBox(height: 8),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
