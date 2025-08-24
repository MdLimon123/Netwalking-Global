import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Privacy Policy"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        children: [
          Container(
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
                    text: 'Information We Collect'
                ),
                SizedBox(height: 8,),
                _subText(text: 'Personal Info: Name, email, location (optional), etc.Usage Data: App activity, interactions, and preferences.Device Info: Device type, operating system, and crash logs.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'How We Use Your Data'
                ),
                SizedBox(height: 8,),
                _subText(text: 'To improve user experience and app functionality.To provide personalized matches and recommendations.To communicate important updates or changes.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Data Sharing'
                ),
                SizedBox(height: 8,),
                _subText(text: 'We do not sell your data.Data may be shared with partners only to improve services and user safety.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Data Security'
                ),
                SizedBox(height: 8,),
                _subText(text: 'We use encryption and other best practices to keep your information safe.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Your Rights'
                ),
                SizedBox(height: 8,),
                _subText(text: 'You can request to view, update, or delete your personal data anytime.You may opt out of marketing communications.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Changes to Policy'
                ),
                SizedBox(height: 8,),
                _subText(text: 'We may update this policy. You will be notified of significant changes.'),


                SizedBox(height: 16,),
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
