import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/join_event_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/formate_even_time.dart';
import 'package:netwalking_global/views/base/time_date.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/event_details_screen.dart';

class AllEventScreen extends StatefulWidget {
  const AllEventScreen({super.key});

  @override
  State<AllEventScreen> createState() => _AllEventScreenState();
}

class _AllEventScreenState extends State<AllEventScreen> {

  final _joinEventController = Get.put(JoinEventController());

  @override
  void initState() {
    _joinEventController.fetchAllEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(_joinEventController.isAllEventLoading.value){
        return Center(child: CustomPageLoading());
      }
      if(_joinEventController.allEventList.isEmpty){
        return Center(child: Text('No Events Yet',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.textColor,
        ),));

      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "event_list".tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final allEvent = _joinEventController.allEventList[index];
                  return InkWell(
                    onTap: () {

                      if(allEvent.status == 'join now'){
                        Get.to(() => EventDetailsScreen(
                          id: allEvent.id,
                        ));
                      }else{
                        Get.to(()=> EventDetailsScreen(id: allEvent.id,));
                      }


                    },
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomNetworkImage(
                                    imageUrl: allEvent.image,
                                    boxShape: BoxShape.circle,
                                    height: 24,
                                    width: 24),
                                SizedBox(width: 8),
                                Text(
                                  allEvent.eventType,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textColor),
                                )
                              ],
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                "${formatEventDate(allEvent.date)}, ${formatEventTime(allEvent.time)}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor),
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "with_group".tr,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  height: 32,
                                  width: 90,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      for(int i = 0; i < allEvent.participants.length; i++)
                                        Positioned(
                                            left: i * 20.0,
                                            child: CustomNetworkImage(
                                                imageUrl: allEvent.participants[i].image,
                                                height: 20,
                                                boxShape: BoxShape.circle,
                                                width: 20)
                                        ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  allEvent.status,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF366B2D),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  );
                },
                separatorBuilder: (_, index) => SizedBox(height: 8),
                itemCount: _joinEventController.allEventList.length,),
            ),
          ],
        ),
      );
    });
  }
}
