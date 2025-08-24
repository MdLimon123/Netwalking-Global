import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "About Us"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        children: [
          Container(
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
                _headingText(text: "NetWalking Global"),
                SizedBox(height: 8,),
                _subText(text:"We believe meaningful connections begin with simple steps. Our mission is to help people find like-minded walking partners, build healthy habits, and enjoy uplifting conversations while staying active. Whether you're walking for health, friendship, or fresh air, we’re here to make every step count." )
              ],
            ),
          )
        ],
      ),
    );
  }

  _subText({required String text}) {
    return Text(text,
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
          fontWeight: FontWeight.w500,
          color: Color(0xFF042547)
      ),);
  }
}
