import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/join_event_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';
import 'package:netwalking_global/views/base/formate_even_time.dart';
import 'package:netwalking_global/views/base/time_date.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/event_details_screen.dart';

class MyEventScreen extends StatefulWidget {
  const MyEventScreen({super.key});

  @override
  State<MyEventScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<MyEventScreen> {

  final _joinEventController = Get.put(JoinEventController());

  @override
  void initState() {
    _joinEventController.fetchMyEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(_joinEventController.isMyEventLoading.value){
        return Center(child: CustomPageLoading());
      }
      if(_joinEventController.myEventList.isEmpty){
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
                    final myEvent = _joinEventController.myEventList[index];
                    return InkWell(
                      onTap: () {
                        if(myEvent.status == 'join now'){
                          Get.to(() => EventDetailsScreen(
                            id: myEvent.id,
                          ));
                        }else{

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
                                      imageUrl: myEvent.image,
                                      boxShape: BoxShape.circle,
                                      height: 24,
                                      width: 24),

                                  SizedBox(width: 8),
                                  Text(
                                    myEvent.eventType,
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
                                  "${formatEventDate(myEvent.date)}, ${formatEventTime(myEvent.time)}",
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

                                        for(int i = 0; i < myEvent.participants.length; i++)
                                          Positioned(
                                            left: i * 20.0,
                                            child: CustomNetworkImage(
                                                imageUrl: myEvent.participants[i].image,
                                                height: 20,
                                                boxShape: BoxShape.circle,
                                                width: 20)
                                          ),


                                       ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(height: 8),
                  itemCount: _joinEventController.myEventList.length),
            ),
          ],
        ),
      );
    });
  }
}
