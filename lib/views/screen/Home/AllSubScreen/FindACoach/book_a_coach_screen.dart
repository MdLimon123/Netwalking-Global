import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/coach_profile_details.dart';

class BookACoachScreen extends StatefulWidget {
  const BookACoachScreen({super.key});

  @override
  State<BookACoachScreen> createState() => _BookACoachScreenState();
}

class _BookACoachScreenState extends State<BookACoachScreen> {
  
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Book a Coach'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        children: [
          
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                  fit: BoxFit.cover)
                ),
              ),
              SizedBox(width: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Amelia Harper",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor
                  ),),
                  SizedBox(height: 4,),
                  Text("Relationship Coach",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor
                    ),),

                ],
              )
              
            ],
          ),
          SizedBox(height: 24,),
          CustomTextField(controller: dateController,
          hintText: 'Select Date',
          filColor: Colors.white,
          prefixIcon:Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.asset("assets/icons/calender.svg"),
          ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset("assets/icons/calender_fill.svg"),
            ),
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: timeController,
            hintText: 'Select Time',
            filColor: Colors.white,
            prefixIcon:Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/event_time.svg"),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset("assets/icons/clock.svg",
              ),
            ),
          ),

          SizedBox(height: 135,),
          InkWell(
            onTap: (){

            },
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text("Coach Profile Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
              ),
            ),
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(
                child: CustomButton(onTap: (){},
                    text: "Confirm Booking"),
              ),
              SizedBox(width: 12,),
              SvgPicture.asset('assets/icons/message_fill.svg')
            ],
          )


        ]
      ),
    );
  }
}
