import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/about_us_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  final _aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
    _aboutUsController.fetchPrivacyPolice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Privacy Policy"),
      body: Obx(()=> _aboutUsController.isPrivacyPoliceLoading.value?
      Center(child: CustomPageLoading()):
      ListView.builder(
          itemCount: _aboutUsController.privacyPoliceList.length,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          itemBuilder: (context, index) {
            final data = _aboutUsController.privacyPoliceList[index];
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headingText(
                      text: data.title
                  ),
                  SizedBox(height: 8,),
                  _subText(
                      text: data.content),

                ],
              ),
            );
          }
      )),
    );
  }

 Widget _subText({required String text}) {
    return Text(text,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF696767)
      ),);
  }

 Widget _headingText({required String text}) {
    return Text(text,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xFF042547)
      ),);
  }
}
