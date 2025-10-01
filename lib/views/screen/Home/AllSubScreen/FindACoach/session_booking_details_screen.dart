import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_book_coach_controller.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';

class SessionBookingDetailsScreen extends StatefulWidget {

  final int id;

  const SessionBookingDetailsScreen({super.key, required this.id});

  @override
  State<SessionBookingDetailsScreen> createState() => _SessionBookingDetailsScreenState();
}

class _SessionBookingDetailsScreenState extends State<SessionBookingDetailsScreen> {

  final _findCoachController = Get.put(FindBookCoachController());

  @override
  void initState() {
    _findCoachController.fetchSessionBookingDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EEF7),
      appBar: CustomAppbar(title: "Coach"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Session Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333)
            ),),
            SizedBox(height: 16,),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Obx((){
                  if(_findCoachController.sessionBookingDataLoading.value){
                    return Center(child: CustomPageLoading());
                  }
                  if(_findCoachController.sessionBookingData.isEmpty){
                    return Center(child: Text("No Data Found"),);
                  }

                  return  ListView.builder(
                    itemCount: _findCoachController.sessionBookingData.length,
                    itemBuilder: (context, index){
                      final sessionData = _findCoachController.sessionBookingData[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _headingText(
                              text: 'Category'
                          ),
                          SizedBox(height: 12,),
                          _subHeadingText(
                              text:sessionData.coachingAreaName
                          ),
                          SizedBox(height: 12,),
                          _headingText(
                              text: 'Coaching Format'
                          ),
                          SizedBox(height: 12,),
                          _subHeadingText(
                              text: sessionData.sessionFormat
                          ),

                          // SizedBox(height: 12,),
                          // _headingText(
                          //     text: 'Language'
                          // ),
                          // SizedBox(height: 12,),
                          // _subHeadingText(
                          //     text: sessionData.languagesSpoken
                          // ),
                          //  SizedBox(height: 12,),

                          // _headingText(
                          //     text: 'Participants'
                          // ),
                          // SizedBox(height: 12,),
                          // _subHeadingText(
                          //     text: 'Mental Health & Wellbeing'
                          // ),
                          SizedBox(height: 12,),

                          _headingText(
                              text: "Time"
                          ),
                          SizedBox(height: 12,),
                          _subHeadingText(
                              text: customTimeDateEvent(sessionData.sessionTime)
                          ),
                          SizedBox(height: 12,),
                          _headingText(
                              text: 'Pricing'
                          ),
                          SizedBox(height: 12,),
                          _subHeadingText(
                              text: sessionData.price.toString()
                          ),
                          SizedBox(height: 12,),
                        ],


                      );
                    },
                  );
                }

                )),
            ),
            SizedBox(height: 50,),
            CustomButton(onTap: (){},
                text: "Start Now")

          ],
        )
      ),
    );
  }

  Widget _subHeadingText({required String text}) {
    return Text(text,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333)
                      ),);
  }

   Widget _headingText({required String text}) {
    return Text(text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333)
                      ),);
  }
}
