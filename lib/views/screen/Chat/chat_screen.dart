import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final sendMessageTextController = TextEditingController();

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
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/image/profile.jpg'),
                    fit: BoxFit.cover)
              ),
            ),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fullstack Designers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),),
                SizedBox(height: 4,),
                Text("12 people",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4F5E7B),
                ),)
              ],
            )
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    constraints: BoxConstraints(maxWidth: 280),
                    decoration: BoxDecoration(
                        color: message['isMe']
                            ? AppColors.primaryColor
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12)

                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              fontSize: 14,
                              color: message['isMe']

                                  ? const Color(0xFFFFFFFF)

                                  : AppColors.textColor
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
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
                  Expanded(child: CustomTextField(controller: sendMessageTextController,
                  hintText: 'Write your message',)),
                  SizedBox(width: 5,),
                  SvgPicture.asset('assets/icons/attach_fill.svg'),
                  SizedBox(width: 5,),
                  SvgPicture.asset('assets/icons/micro.svg'),
                  SizedBox(width: 20,),
                  Container(
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
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
