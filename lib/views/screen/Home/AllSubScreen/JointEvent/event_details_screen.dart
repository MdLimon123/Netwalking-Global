import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/chat_controller.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/controllers/join_event_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';
import 'package:netwalking_global/views/base/formate_even_time.dart';
import 'package:netwalking_global/views/screen/Chat/chat_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/joint_book_a_coach_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsScreen extends StatefulWidget {

  final int id;

  const EventDetailsScreen({super.key, required this.id});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {

  final _joinEventController = Get.put(JoinEventController());

  final _dataController = Get.find<DataController>();

  final _chatController = Get.put(ChatController());

  Future<void> openMap(String location) async {
    try {

      List<Location> locations = await locationFromAddress(location);
      if (locations.isNotEmpty) {
        final lat = locations.first.latitude;
        final lng = locations.first.longitude;


        final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          Get.snackbar("Error", "Could not open maps.");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Location not found: $e");
    }
  }

   String status = "";
  int id = 0;
  String name = "";
  String image = "";


  @override
  void initState() {
    _joinEventController.fetchEventDetails(id: widget.id);
    for(int i =0; i<_joinEventController.eventDetailsList.length; i++){
      status = _joinEventController.eventDetailsList[i].status;
      id = _joinEventController.eventDetailsList[i].id;
      name = _joinEventController.eventDetailsList[i].userName;
      image = _joinEventController.eventDetailsList[i].image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "event_details".tr),
      body: Obx(()=> _joinEventController.isEventDetailsLoading.value?
      Center(child: CustomPageLoading()):
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child:   ListView.builder(
                  itemCount: _joinEventController.eventDetailsList.length,
                  itemBuilder: (context, index){
                    final eventDetails = _joinEventController.eventDetailsList[index];
                    print("Event Details ===================> ${eventDetails.userName}");
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [Color(0xFF256BDD), Color(0xFF07727E)],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "public_event".tr,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        eventDetails.eventType,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  CustomNetworkImage(
                                      imageUrl: eventDetails.image,
                                      boxShape: BoxShape.circle,
                                      height: 60,
                                      width: 60),

                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                eventDetails.description,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    "${customTimeDateEvent(eventDetails.date)},${customTimeDateEvent(eventDetails.time)}",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(colors: [Color(0xFFD38656), Color(0xFFF9AC69)]),
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Host - ${eventDetails.userName}",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "${eventDetails.totalParticipants}Join",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            _customContainer(
                                text: eventDetails.location,
                                image: 'assets/icons/location.svg'),
                            SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  openMap(eventDetails.location);

                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("direction".tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                                      SvgPicture.asset('assets/icons/direction.svg'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/walk.svg', height: 20, width: 20),
                                    SizedBox(width: 8),
                                    Text(eventDetails.pace, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/language.svg', height: 20, width: 20),
                                    SizedBox(width: 8),
                                    Text(eventDetails.language, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            _customContainer(text: eventDetails.cost.toString(), image: 'assets/icons/cost.svg'),
                            SizedBox(width: 12),
                            _customContainer(text: "no".tr, image: 'assets/icons/man.svg')
                          ],
                        ),
                      ],
                    );
                  }),),
            InkWell(
              onTap: (){
                _chatController.createChat(id: id, name: name, image: image);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFF8EB2D8), width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/chat.svg'),
                    SizedBox(width: 8),
                    Text(
                      "Chat Now",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            buildActionSection(status, widget.id,
                _dataController.id.value,
                _joinEventController.eventDetailsList[0].userId,
                _joinEventController.eventDetailsList[0].isStarted,
              _joinEventController.eventDetailsList[0].isCompleted
              ),

            // status == 'join now'?
            // Container(
            //   height: 48,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Color(0xFFFFFFFF),
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(color: Color(0xFF8EB2D8), width: 0.5),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset('assets/icons/chat.svg'),
            //       SizedBox(width: 8),
            //       Text("chat_now".tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor))
            //     ],
            //   ),
            // ): SizedBox(),
            // SizedBox(height: 24),
            // status == 'join now'?
            // Obx(
            //     ()=> CustomButton(
            //
            //     loading: _joinEventController.isJoinLoading.value,
            //       onTap: () {
            //         _joinEventController.joinEventNow(id: widget.id);
            //         },
            //       text: "joint_event".tr),
            // ): SizedBox(),
          ],
        ),
      )),
    );
  }

  Widget buildActionSection(String status, int id, int loginUserId, int eventOwnerId, bool isStarted, bool isCompleted) {


    if(isCompleted && isStarted){
      return CustomButton(
        loading: _joinEventController.isJoinLoading.value,
        color: Colors.transparent,
        onTap: () {},
        text: "Completed",
      );
    }


    if(loginUserId == eventOwnerId) {
      if (!isStarted) {
        return Obx(
          ()=> CustomButton(
            loading: _joinEventController.isStartEventLoading.value,
            onTap: () {
              _joinEventController.startEvent(id: id);
            },
            text: "Start Now",
          ),
        );
      }
     return Obx(
       ()=> CustomButton(
          loading: _joinEventController.isCompletedEventLoading.value,
          onTap: () {
              _joinEventController.markAsCompletedEvent(id: id);
          },
          text: "Mark As Complete",
        ),
     );

    }
    else if (isStarted) {
      return Obx(
            () => Column(
          children: [

            CustomButton(
              loading: _joinEventController.isJoinLoading.value,
              onTap: () {
                _joinEventController.joinEventNow(id: id);
              },
              text: "Join Now",
            ),



          ],
        ),
      );
    }

    return SizedBox();

  }







  Widget _customContainer({required String text, required String image}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 8),
            Expanded(
              child: Text(text, style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w400, color: AppColors.textColor),
              overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
      ),
    );
  }
}
