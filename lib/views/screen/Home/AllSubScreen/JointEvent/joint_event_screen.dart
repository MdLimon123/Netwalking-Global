import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/join_event_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/AllTabsScreen/Widgets/tabs_widget_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/create_new_event_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/event_details_screen.dart';

class JointEventScreen extends StatefulWidget {
  const JointEventScreen({super.key});

  @override
  State<JointEventScreen> createState() => _JointEventScreenState();
}

class _JointEventScreenState extends State<JointEventScreen> {

  final _joinEventController = Get.put(JoinEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "joint_an_event".tr),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _joinEventController.tabList.length,
                itemBuilder: (context, index) {
                  return Obx(() {


                    return TabsWidgetScreen(
                      onTap: () {
                        _joinEventController.tabIndex.value = index;
                      },
                      isSelected: _joinEventController.isTabSelected(index),
                      tabName: _joinEventController.tabList[index],

                    );
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Obx(() {
              return _joinEventController
                  .tabSections[_joinEventController.tabIndex.value];
            }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          onTap: () {
            Get.to(() => CreateNewEventScreen());
          },
          text: "create_new_event".tr,
        ),
      ),
    );
  }
}
