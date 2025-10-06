import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/about_us_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  final _aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
   _aboutUsController.fetchAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "About Us"),
      body: Obx(()=> _aboutUsController.isAboutUsLoading.value?
      Center(child: CustomPageLoading()):
      ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          itemCount: _aboutUsController.aboutUsList.length,
          itemBuilder: (context, index){
            final data = _aboutUsController.aboutUsList[index];
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headingText(text: data.title),
                  SizedBox(height: 8,),
                  _subText(text: data.content )
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
