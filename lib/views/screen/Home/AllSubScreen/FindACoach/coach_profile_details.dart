import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:netwalking_global/controllers/find_book_coach_controller.dart';
import 'package:netwalking_global/models/coach_profile_model.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/get_first_avabile.dart';

class CoachProfileDetailsScreen extends StatefulWidget {
  final int id;
  const CoachProfileDetailsScreen({super.key, required this.id});

  @override
  State<CoachProfileDetailsScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileDetailsScreen> {

  final _findCoachController = Get.put(FindBookCoachController());

  @override
  void initState() {
    _findCoachController.fetchCoachProfile(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Coach Profile"),
      body: Obx((){
        if(_findCoachController.isCoachProfileLoading.value){
          return Center(child: CustomPageLoading());
        }
        if(_findCoachController.coachProfile.value == null){
          return Center(child: Text("No Data Found"));
        }
        final data = _findCoachController.coachProfile.value!;
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  CustomNetworkImage(
                      imageUrl: data.image,
                      boxShape: BoxShape.circle,
                      height: 80,
                      width: 80),

                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.fullName,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(data.coachingAreaNames.first,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),

                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              _buildRow(
                  image: 'assets/icons/location.svg',
                  text: 'From ${data.location}'),
              SizedBox(height: 8),
              _buildRow(
                  image: 'assets/icons/global.svg',
                  text: 'Languages: ${data.languagesSpoken}'),
              SizedBox(height: 8),
              _buildRow(
                  image: 'assets/icons/computer.svg',
                  text: 'Coaching Format: ${data.sessionFormat}'),
              SizedBox(height: 20),
              Text("About Coach",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 8),
              Text(data.bio,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 20),
              Text("Special Considerations",style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
              SizedBox(height: 8),

              Row(
                children: [
                  Text("Neurodiversity Affirming: ${data.neurodiversityAffirming}",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                  SvgPicture.asset('assets/icons/tik.svg')
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("LGBTQIA+ Affirming: ${data.lgbtqiaAffirming}",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                  SvgPicture.asset('assets/icons/tik.svg')
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Gender Sensitive: ${data.genderSensitive}",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                  SvgPicture.asset('assets/icons/tik.svg')
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Trauma Sensitive: ${data.traumaSensitive}",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                  SvgPicture.asset('assets/icons/close_fill.svg')
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Faith-Based Approach: ${data.faithBased}",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                  SvgPicture.asset('assets/icons/tik.svg')
                ],
              ),
              SizedBox(height: 20,),


              Text("Website and Social Links",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Text(data.personalWebsite.toString(),
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Text(data.linkedinProfile.toString(),
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Text("instagram.com/maria.hernandez",
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Text("Availability",
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 8),

              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(12)),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("19 July, 2025",
              //               style: TextStyle(
              //                 color: Color(0xFF1F2937),
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w400,
              //               )),
              //           SvgPicture.asset('assets/icons/calender.svg')
              //         ],
              //       ),
              //       SizedBox(height: 18),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   color: Color(0xFFE6ECF3),
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(
              //                       color: Color(0xFF3368A1), width: 0.5)),
              //               child: Text("9:00 AM-10:00 AM",
              //                   style: TextStyle(
              //                     color: Color(0xFF3368A1),
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   )),
              //             ),
              //           ),
              //           SizedBox(width: 10),
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   color: Color(0xFFE6ECF3),
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(
              //                       color: Color(0xFF3368A1), width: 0.5)),
              //               child: Text("11:00 AM-12:00 PM",
              //                   style: TextStyle(
              //                     color: Color(0xFF3368A1),
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   )),
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 10),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   color: Color(0xFFE6ECF3),
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(
              //                       color: Color(0xFF3368A1), width: 0.5)),
              //               child: Text("12:00 PM-1:00 PM",
              //                   style: TextStyle(
              //                     color: Color(0xFF3368A1),
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   )),
              //             ),
              //           ),
              //           SizedBox(width: 10),
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   color: Color(0xFFE6ECF3),
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(
              //                       color: Color(0xFF3368A1), width: 0.5)),
              //               child: Text("4:00 PM-5:00 PM",
              //                   style: TextStyle(
              //                     color: Color(0xFF3368A1),
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w400,
              //                   )),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              buildAvailabilitySection(data.availability),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Pricing:',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('\$ ${data.pricePerSession}',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
              SizedBox(height: 32),
              Obx(
                    ()=> CustomButton(
                  loading: _findCoachController.isCoachBookingLoading.value,
                    onTap: () {

                      final slot = getFirstAvailableSlot(data.availability);

                      _findCoachController.coachBooking(
                          coachId: data.userId,
                          coachingArea: data.coachingAreas.first,
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          time: slot!.from,
                          sessionFormat: data.sessionFormat,
                          price: data.pricePerSession);
                    },
                    text: 'Confirm Booking'),
              )
            ],
          ),
        );

      }),

    );
  }

  _buildRow({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 4),
        Text(text,
            style: TextStyle(
                color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ))
      ],
    );
  }


  Widget buildAvailabilitySection(Availability availability) {

    final List<TimeSlot> allSlots = [];
    availability.toJson().forEach((day, list) {
      for (var s in list ?? []) {
        allSlots.add(TimeSlot.fromJson(s));
      }
    });


    List<Widget> rows = [];
    for (var i = 0; i < allSlots.length; i += 2) {
      final first = allSlots[i];
      final second = (i + 1 < allSlots.length) ? allSlots[i + 1] : null;

      rows.add(
        Row(
          children: [
            Expanded(child: _timeBox("${first.from} - ${first.to}")),
            const SizedBox(width: 10),
            Expanded(
              child: second != null
                  ? _timeBox("${second.from} - ${second.to}")
                  : const SizedBox(),
            ),
          ],
        ),
      );

      rows.add(const SizedBox(height: 10));
    }

    return  Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat("d MMM, yyyy").format(DateTime.now()),
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              SvgPicture.asset('assets/icons/calender.svg')
            ],
          ),
          SizedBox(height: 18),

          ...rows,


        ],
      ),
    );

  }
  Widget _timeBox(String text) {
    return Container(
      alignment: Alignment.center,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFE6ECF3),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF3368A1), width: 0.5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF3368A1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }


}
