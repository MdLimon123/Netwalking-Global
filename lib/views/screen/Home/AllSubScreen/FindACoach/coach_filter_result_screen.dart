import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';

class CoachFilterResultScreen extends StatefulWidget {
  const CoachFilterResultScreen({super.key});

  @override
  State<CoachFilterResultScreen> createState() => _CoachFilterResultScreenState();
}

class _CoachFilterResultScreenState extends State<CoachFilterResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Coach Filter Result"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filter Result",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
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
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                                          fit: BoxFit.cover)
              
                                  )),
                              SizedBox(width: 8,),
                              Text("Dr. Amela Harper",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor
                                ),)
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Expanded(
                                child: Text("Specialty: Communication & Conflict Resolution",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF545454)
                                  ),),
                              ),
                              Spacer(),
                              Text("Book Now",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor:  AppColors.textColor,
                                    color: AppColors.textColor
                                ),)
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                  separatorBuilder: (__, _)=>SizedBox(height: 12,) ,
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
