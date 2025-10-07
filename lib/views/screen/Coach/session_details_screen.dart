import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/coach_profile_setup_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_switch.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';

class SessionDetailsScreen extends StatefulWidget {
  final int id;
  const SessionDetailsScreen({super.key, required this.id});

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {

  final sessionLinkController = TextEditingController();
  final _coachProfileSetupController = Get.put(CoachProfileSetupProfile());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _coachProfileSetupController.fetchCoachSessionDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Session Details'),
      body: Obx(()=> _coachProfileSetupController.isCoachSessionLoading.value?
      Center(child: CustomPageLoading()):
      Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Session Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                const Spacer(),
                Text(
                  "As A Coach",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(width: 8),
                CustomSwitch(
                  value: true,
                  onChanged: (val) {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _coachProfileSetupController.coachSessionDetails.length,
                    itemBuilder:(context, index){
                      final data = _coachProfileSetupController.coachSessionDetails[index];
                      return Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headingText(
                                title: 'Category'
                            ),
                            SizedBox(height: 12,),
                            _subHeadingText(
                                subText: data.coachingAreaName
                            ),
                            SizedBox(height: 12,),
                            _headingText(
                                title: 'Coaching Format'
                            ),
                            SizedBox(height: 12,),
                            _subHeadingText(
                                subText: data.sessionFormat
                            ),
                            // SizedBox(height: 12,),
                            // _headingText(
                            //     title: 'Language'
                            // ),
                            // SizedBox(height: 12,),
                            // _subHeadingText(
                            //     subText: dat
                            // ),

                            SizedBox(height: 12,),
                            _headingText(
                                title: 'Time'
                            ),
                            SizedBox(height: 12,),
                            _subHeadingText(
                                subText: customTimeDateEvent(data.sessionTime)
                            ),
                            SizedBox(height: 12,),
                            _headingText(
                                title: 'Pricing'
                            ),
                            SizedBox(height: 12,),
                            _subHeadingText(
                                subText: data.price.toString()
                            ),
                            SizedBox(height: 16,),

                            _headingText(
                                title: 'Link'
                            ),
                            SizedBox(height: 12,),
                            CustomTextField(
                              controller: sessionLinkController,
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Please Enter Link";
                                }
                                return null;
                              },
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: SvgPicture.asset('assets/icons/file.svg'),
                              ),
                              hintText: "Paste Link",)


                          ],
                        ),
                      );
                    })

            ),
            SizedBox(height: 56,),
            CustomButton(
              loading: _coachProfileSetupController.isLinkLoading.value,
                onTap: (){
                if(_formKey.currentState!.validate()){
                _coachProfileSetupController.submitSessionLink(id: widget.id,
                link: sessionLinkController.text);
                }
            },
                text: "Send Now")

          ],
        ),
      )),
    );
  }

  Widget _subHeadingText({required String subText}) {
    return Text(
                        subText,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      );
  }

  Widget _headingText({required String title}) {
    return Text(title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),);
  }
}
