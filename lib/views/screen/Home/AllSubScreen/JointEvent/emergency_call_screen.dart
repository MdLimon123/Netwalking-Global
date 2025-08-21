import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class EmergencyCallScreen extends StatefulWidget {
  const EmergencyCallScreen({super.key});

  @override
  State<EmergencyCallScreen> createState() => _EmergencyCallScreenState();
}

class _EmergencyCallScreenState extends State<EmergencyCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Emergency Call"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("333",
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD72323),
              decorationColor: Color(0xFF59B14A),
                decoration: TextDecoration.underline
            ),),
          ),
          SizedBox(height: 50,),
          Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF59B14A)
            ),
            child: SvgPicture.asset('assets/icons/phone.svg'),
            
          )
        ],
      ),
    );
  }
}
