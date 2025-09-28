import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Terms of services"),
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
                  text: 'Acceptance of Terms'
                ),
                SizedBox(height: 8,),
                _subText(text: 'Have a question, feedback, or need help? Our team is here to assist you'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'User Responsibilities'
                ),
                SizedBox(height: 8,),
                _subText(text: 'You are responsible for maintaining the security of your account. You agree to use the app respectfully, avoiding abusive or inappropriate behavior toward others'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Use of the App'
                ),
                SizedBox(height: 8,),
                _subText(text: 'You are responsible for maintaining the security of your account. You agree to use the app respectfully, avoiding abusive or inappropriate behavior toward others'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Privacy'
                ),
                SizedBox(height: 8,),
                _subText(text: 'You are responsible for maintaining the security of your account. You agree to use the app respectfully, avoiding abusive or inappropriate behavior toward others'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Matchmaking & Walks'
                ),
                SizedBox(height: 8,),
                _subText(text: 'Our algorithm helps connect people for walking sessions based on shared interests, availability, and location. We do not guarantee a match.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Content Ownership'
                ),
                SizedBox(height: 8,),
                _subText(text: 'You retain ownership of the content you share (like photos or bios), but grant us permission to display it within the app.'),
                SizedBox(height: 16,),
                _headingText(
                    text: 'Contact'
                ),
                SizedBox(height: 8,),
                _subText(text: 'For any questions about these Terms, contact us at:'),
                SizedBox(height: 2,),
                Text("support@netwalkingapp.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0957AA)
                  ),),
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
