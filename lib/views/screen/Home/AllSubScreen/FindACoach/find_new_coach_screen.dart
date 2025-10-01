import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/find_book_coach_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/FindACoach/coach_filter_result_screen.dart';

class FindNewCoachScreen extends StatefulWidget {
  const FindNewCoachScreen({super.key});

  @override
  State<FindNewCoachScreen> createState() => _FindNewCoachScreenState();
}

class _FindNewCoachScreenState extends State<FindNewCoachScreen> {

  final textController = TextEditingController();

  final _findCoachController = Get.put(FindBookCoachController());



  @override
  void initState() {
    _findCoachController.fetchAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Find New Coach"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        children: [
          Text("What do you need help with?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor
          ),),
          SizedBox(height: 12,),
          Container(
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
                SvgPicture.asset('assets/icons/right.svg'),
                SizedBox(height: 4,),
                CustomTextField(controller: textController,
                maxLines: 5,
                filColor: Colors.white,
                borderColor: Color(0xFFB3CBE5),
                hintText: 'Write here',)
              ],
            )
          ),
          SizedBox(height: 12,),
        CustomDropdownCheckbox(
            title: "Enter your gender",
            bgColor: Colors.white,
            showCheckbox: false,
            leadingIcon: SvgPicture.asset('assets/icons/gender.svg'),
            options: _findCoachController.gender,
            onChanged: (val){
              _findCoachController.selectedGender.value = val.first;
            }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Language",
              options: _findCoachController.language,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: SvgPicture.asset('assets/icons/language.svg',
                height: 24,
                width: 24,),
              onChanged: (val){
                _findCoachController.selectedLanguage.value = val.first;
              }),
          SizedBox(height: 12,),
          Obx(() {
            if (_findCoachController.isAllCategoryLoading.value) {
              return Center(child: CustomPageLoading());
            }
            if (_findCoachController.allCategoryList.isEmpty) {
              return Text("No categories found");
            }

            return CustomDropdownCheckbox(
              title: "Coaching Focus",
              options: _findCoachController.allCategoryList
                  .map((e) => e.name)
                  .toList(),
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF0061FF), Color(0xFF60EFFF)],
                  ),
                ),
              ),
              onChanged: (val) {
                final selected = _findCoachController.allCategoryList
                    .firstWhereOrNull((cat) => cat.name == val);
                if (selected != null) {
                  print("Selected Category ID: ${selected.id}");
                  print("Selected Category Name: ${selected.name}");
                }
              },
            );
          }),

          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Preferred Coaching Format",
              options: _findCoachController.preferredCoach,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF48F6A4),
                          Color(0xFF0F8A98)
                        ]
                    )
                ),
              ),
              onChanged: (val){
                _findCoachController.selectedFormat.value = val.first;
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Coach Experience Level",
              options: _findCoachController.coachLevel,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF595CFF),
                          Color(0xFFC6F8FF)
                        ]
                    )
                ),
              ),
              onChanged: (val){
                _findCoachController.selectedLevel.value = val.first;
              }),
          SizedBox(height: 12,),
          CustomDropdownCheckbox(
              title: "Coach Availability",
              options: _findCoachController.coachAvailability,
              bgColor: Colors.white,
              showCheckbox: false,
              leadingIcon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFD38656),
                          Color(0xFFF9AC69)
                        ]
                    )
                ),
              ),
              onChanged: (val){
                _findCoachController.selectedAvailability.value = val.first;
              }),
          SizedBox(height: 50,),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 0.5)
                  ),
                  child: Center(
                    child: Text("Clear",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
                  ),
                ),
              ),
              SizedBox(width: 24,),
              Expanded(
                  child: CustomButton(onTap: (){
                _findCoachController.fetchCoachFilter();
                Get.to(()=>CoachFilterResultScreen());
              },
                  text: 'Apply Now'))
            ],
          )

        ],
      ),
    );
  }
}
