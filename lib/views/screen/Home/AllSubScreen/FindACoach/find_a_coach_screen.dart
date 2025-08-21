import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';

class FindACoachScreen extends StatefulWidget {
  const FindACoachScreen({super.key});

  @override
  State<FindACoachScreen> createState() => _FindACoachScreenState();
}

class _FindACoachScreenState extends State<FindACoachScreen> {

   bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Find a Coach"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Recent",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                ),),
                Spacer(),
                Text("As a Coach",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
                SizedBox(width: 8,),
                CustomSwitch(
                    value: isSwitched,
                    onChanged: (val){
                      setState(() {
                        isSwitched = val;
                      });
                    })
              ],
            ),

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
                              Text("Specialty: Communication",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF545454)
                              ),),
                              Spacer(),
                              Text("Confirmed",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF468A3A)
                              ),)
                            ],
                          ),
                          SizedBox(height: 6,),
                          Text("Today 8.00",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                          ),)
                        ],
                      ),
                    );

                  },
                  separatorBuilder: (__, index)=> SizedBox(height: 8),
                  itemCount: 10),
            ),
            CustomButton(onTap: (){},
                text: "Find New Coach")
          ],
        ),
      ),
    );
  }
}
