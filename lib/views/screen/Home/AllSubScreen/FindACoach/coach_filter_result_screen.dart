import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_book_coach_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/coach_profile_details.dart';

class CoachFilterResultScreen extends StatefulWidget {
  const CoachFilterResultScreen({super.key});

  @override
  State<CoachFilterResultScreen> createState() => _CoachFilterResultScreenState();
}

class _CoachFilterResultScreenState extends State<CoachFilterResultScreen> {

  final _findCoachController = Get.find<FindBookCoachController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Coach Filter Result"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filter Result",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            Obx(()=> _findCoachController.isCoachFilterLoading.value?
            Center(child: CustomPageLoading()):
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    final data = _findCoachController.coachFilterList[index];
                    return InkWell(
                      onTap: (){
                        Get.to(()=> CoachProfileDetailsScreen(
                          id: data.userId,
                        ));
                      },
                      child: Container(
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
                                    imageUrl: data.image,
                                    height: 24,
                                    boxShape: BoxShape.circle,
                                    width: 24),

                                SizedBox(width: 8,),
                                Text(data.fullName,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textColor
                                  ),)
                              ],
                            ),
                            SizedBox(height: 6,),
                            Row(
                              children: [
                                Expanded(
                                  child: Text("Specialty: ${data.coachingAreaNames}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF545454)
                                    ),),
                                ),
                                Spacer(),
                                Text("Book Now",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      decorationColor:  AppColors.textColor,
                                      color: AppColors.textColor
                                  ),)
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, _)=>SizedBox(height: 12,) ,
                  itemCount: _findCoachController.coachFilterList.length),
            ))
          ],
        ),
      ),
    );
  }
}
