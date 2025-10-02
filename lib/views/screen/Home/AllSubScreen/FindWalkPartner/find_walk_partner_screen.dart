import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_patner_walk_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindWalkPartner/find_new_partner_screen.dart';

class FindWalkPartnerScreen extends StatefulWidget {
  const FindWalkPartnerScreen({super.key});

  @override
  State<FindWalkPartnerScreen> createState() => _FindWalkPartnerScreenState();
}

class _FindWalkPartnerScreenState extends State<FindWalkPartnerScreen> {

  final _findPartnerWalkController = Get.put(FindPartnerWalkController());

  @override
  void initState() {
    _findPartnerWalkController.fetchFindPartnerWalk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Find Walk Partner'),
      body: Obx(()=> _findPartnerWalkController.isFindPatnerWalkLoading.value?
      Center(child: CustomPageLoading()):
      Padding(
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
                    final data = _findPartnerWalkController.findPartnerWalkList[index];
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

                              CustomNetworkImage(
                                  imageUrl: data.invitedUserImage,
                                  height: 24,
                                  boxShape: BoxShape.circle,
                                  width: 24),

                              // Container(
                              //     height: 24,
                              //     width: 24,
                              //     decoration: BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                              //             fit: BoxFit.cover)
                              //
                              //     )),
                              SizedBox(width: 8,),
                              Text(data.wakingDistance,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor
                                ),),
                              Spacer(),

                              if (data.status == "pending") ...[
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF666614),
                                  ),
                                ),
                              ] else if (data.status == "confirmed") ...[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE8F2ED),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Confirmed",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ),
                              ] else if (data.status == "completed") ...[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE8F2ED),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Completed",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF333333)
                                    ),
                                  ),
                                ),
                              ] else if (data.status == "canceled") ...[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFBC193C),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    "Rejected",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],


                            ],
                          ),
                          SizedBox(height: 6,),

                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(data.invitedUserName,
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
                                Text(customTimeDateEvent(data.sessionDate),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor
                                  ),),

                                Spacer(),
                                data.status == "pending" ?SizedBox():  Container(
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
                  itemCount: _findPartnerWalkController.findPartnerWalkList.length),
            ),

            CustomButton(onTap: (){
              Get.to(()=> FindNewPartnerScreen());
            }, text: "Find New Partner")
          ],
        ),
      )),
    );
  }
}
