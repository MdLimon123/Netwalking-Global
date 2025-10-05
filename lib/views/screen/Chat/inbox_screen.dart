import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:netwalking_global/controllers/chat_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/screen/Chat/chat_screen.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {

  final _chatController = Get.put(ChatController());



  String formatTime(String timestamp) {
    final dateTime = DateTime.parse(timestamp).toLocal();
    return DateFormat('hh:mm a').format(dateTime);
  }


  @override
  void initState() {
    _chatController.fetchAllInbox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Text("Chat",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
        ),),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: (){
                Get.to(()=> NotificationScreen());
              },
              child: SvgPicture.asset('assets/icons/notification.svg')),
          SizedBox(width: 10,)
        ],
      ),
      body: Obx((){
        if(_chatController.allInboxLoading.value){
          return Center(child: CustomPageLoading());
        }else if(_chatController.allInboxMessage.isEmpty){
          return Center(child: Text("No Chat Found",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),));
        }
        return ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            itemBuilder: (context, index){
              final data = _chatController.allInboxMessage[index];
              return InkWell(
                onTap: (){
                 _chatController.createChat(
                     id: data.roomId,
                     name: data.user.fullName,
                     image: data.user.image);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomNetworkImage(
                              imageUrl: data.user.image,
                              boxShape: BoxShape.circle,
                              height: 32,
                              width: 32),


                          SizedBox(width: 10,),
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.user.fullName,
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 150,),
                                  Text(
                                    formatTime(data.lastMessage.timestamp.toIso8601String()),
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                data.lastMessage.content.isNotEmpty
                                    ? data.lastMessage.content
                                    : "No messages yet",
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_,_)=> SizedBox(height: 8,),
            itemCount: _chatController.allInboxMessage.length);
      }),
      bottomNavigationBar: BottomMenu(2),
    );
  }
}
