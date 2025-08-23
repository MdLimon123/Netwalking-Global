import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindWalkPartner/find_new_partner_screen.dart';

class FindWalkPartnerScreen extends StatefulWidget {
  const FindWalkPartnerScreen({super.key});

  @override
  State<FindWalkPartnerScreen> createState() => _FindWalkPartnerScreenState();
}

class _FindWalkPartnerScreenState extends State<FindWalkPartnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Find Walk Partner'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Partner Requested",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 12,),
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
                              Text("0.8 Km away",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor
                                ),),
                              Spacer(),
                              Container(
                                width: 60,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Color(0xFFE6EEF7))
                                ),
                                child: Center(
                                  child: Text("Decline",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF545454)
                                  ),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 6,),

                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text("Mike Rodriguez",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF545454)
                                  ),),
                              ),


                          SizedBox(height: 6,),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Row(
                              children: [
                                Text("Today 8.00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor
                                  ),),

                                Spacer(),
                                Container(
                                  width: 60,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Color(0xFFE8F2ED))
                                  ),
                                  child: Center(
                                    child: Text("Accept",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF545454)
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );

                  },
                  separatorBuilder: (__, index)=> SizedBox(height: 8),
                  itemCount: 10),
            ),

            CustomButton(onTap: (){
              Get.to(()=> FindNewPartnerScreen());
            }, text: "Find New Partner")
          ],
        ),
      ),
    );
  }
}
