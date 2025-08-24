import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppbar(title: "Subscription"),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            Text("Your current package",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFCC6F36),
                                    Color(0xFFD7BA18)
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/subcriptions_fill.svg'),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Premium",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor
                              ),),
                            Text("4.9 /month per month",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                              ),),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(height: 16,),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Color(0xFF0957AA),
                    ),
                    SizedBox(height: 28),
                    Text("Features",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("ISSUES FREQUENT",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("MAINTENANCE NEWSPAPER",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("BUY PRODUCTS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("PROBLEM IN MY POOL",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A),
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.close,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("CALCULATOR OF CHEMICALS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A),
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.close,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("TRICKS AND SECRETS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 28,),
                    CustomButton(onTap: (){},
                        text: "Update Now"),
                    SizedBox(height: 20,)
                  ]
              ),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFCC6F36),
                                    Color(0xFFD7BA18)
                                  ]
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/subcriptions_fill.svg'),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Basic",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor
                              ),),
                            Text("Free",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor
                              ),),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(height: 16,),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Color(0xFF0957AA),
                    ),
                    SizedBox(height: 28),
                    Text("Features",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("ISSUES FREQUENT",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("MAINTENANCE NEWSPAPER",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("BUY PRODUCTS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.check,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("PROBLEM IN MY POOL",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A),
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.close,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("CALCULATOR OF CHEMICALS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFF8A8A8A),
                              shape: BoxShape.circle
                          ),
                          child:  Center(
                            child: Icon(Icons.close,
                              color: Colors.white,
                              size: 12,),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("TRICKS AND SECRETS",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 28,),
                    CustomButton(onTap: (){},
                        text: "Update Now"),
                    SizedBox(height: 20,)
                  ]
              ),
            ),
          ],
        )
    );
  }
}
