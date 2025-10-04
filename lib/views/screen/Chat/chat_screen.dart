import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:netwalking_global/controllers/chat_controller.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/models/all_message_model.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class ChatScreen extends StatefulWidget {

  final int id;
  final String image;
  final String name;

  const ChatScreen({super.key, required this.id, required this.image, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final sendMessageTextController = TextEditingController();

  final _chatController = Get.put(ChatController());
  ScrollController scrollController = ScrollController();

  final _dataController = Get.put(DataController());

  final List<Map<String, dynamic>> messages = [
    {
      "text": "Hello, how can I assist you today?",
      "isMe": true,
    },
    {
      "text": "Hello, how can I assist you today?",
      "isMe": false,
    },
    {
      "text": "Hello, how can I assist you today?",
      "isMe": true,
    }
  ];

  @override
  void initState() {
    print("id ===============>${widget.id}");
    print("roomId ===============>${_chatController.roomId.value}");
    print("data id ===============>${_dataController.id.value}");
    _dataController.getUserData();
    _chatController.fetchAllMessage(id: _chatController.roomId.value);
    _chatController.initialize(userId: _dataController.id.value,
        id: _chatController.roomId.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
                child: Icon(Icons.arrow_back,color: AppColors.textColor,)),
            SizedBox(width: 10,),

            CustomNetworkImage(
                imageUrl: widget.image,
                boxShape: BoxShape.circle,
                height: 40,
                width: 40),

            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),),
                SizedBox(height: 4,),
                // Text("12 people",
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                //   color: Color(0xFF4F5E7B),
                // ),)
              ],
            )
          ],
        ),
      ),

      body: Column(
        children: [

          Expanded(
            child: Obx(
                  () =>
                  _chatController.isFirstLoading.value
                  ? Center(child: CustomPageLoading())
                  : Column(
                children: [
                  Expanded(
                    child: _chatController.allChatMessage.isEmpty
                        ? Center(child: Text("Start Chatting now"))
                        : GroupedListView<AllMessageModel, DateTime>(
                      elements: _chatController.allChatMessage,
                      controller: _chatController.scrollController,
                      order: GroupedListOrder.DESC,
                      itemComparator: (item1, item2) =>
                          (item1.timestamp ?? DateTime.now())
                              .compareTo(item2.timestamp ?? DateTime.now()),
                      groupBy: (message) =>
                          DateTime(
                            (message.timestamp ?? DateTime.now()).year,
                            (message.timestamp ?? DateTime.now()).month,
                            (message.timestamp ?? DateTime.now()).day,
                          ),
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      groupSeparatorBuilder: (DateTime date) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              DateFormat.yMMMd().format(date),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        );
                      },
                      itemBuilder: (context, AllMessageModel message) {
                        final bool isSender = message.sender == _dataController.id.value;
                        return _buildChatMessage(
                            context, message.content, isSender,
                            message.timestamp);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),



          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                      fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                      child: CustomTextField(
                        onFieldSubmitted: (value){
                          _chatController.sendMessage();
                        },
                    controller: _chatController.messageController,
                  hintText: 'Write your message',)),
                  SizedBox(width: 5,),
                  SvgPicture.asset('assets/icons/attach_fill.svg'),
                  SizedBox(width: 5,),
                  SvgPicture.asset('assets/icons/micro.svg'),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: (){
                      _chatController.sendMessage();
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF094EBE),
                            Color(0xFF15AABA)
                          ]
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset('assets/icons/send.svg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }

  Widget _buildChatMessage(BuildContext context,
      String message,
      bool isSender,
      DateTime? timestamp,) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery
              .of(context)
              .size
              .width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSender
              ? Color(0xFF0743A2) // Sender = Blue
              : Color(0xFFE5E7EB), // Receiver = Light Gray
          borderRadius:BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isSender ? Colors.white : Color(0xFF374151),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat.jm().format(timestamp ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 11,
                  color: isSender ? Colors.white70 : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
