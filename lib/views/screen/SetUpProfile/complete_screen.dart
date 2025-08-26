import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70),
            width: double.infinity,
            color: Color(0xFFE6EEF7),
            child: Column(
              children: [
                SvgPicture.asset('assets/icons/success.svg'),
                SizedBox(height: 50,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("You’re All Set!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                  ),),
                ),
                SizedBox(height: 8,),
                Text('ou’re now ready to start your journey. Enjoy your walk!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),
                textAlign: TextAlign.center,),
                SizedBox(height: 83,),
                CustomButton(onTap: (){
                  Get.offAllNamed(AppRoutes.homeScreen);
                },
                    text: "Go To Home")
              ],
            ),
          )
        ],
      ),
    );
  }
}
