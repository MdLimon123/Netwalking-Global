import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/controllers/profile_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_radio_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isSwitch = false;
  List<bool> isCheck = List.generate(11, (_) => false);

  final _profileController = Get.put(ProfileController());

  List<String> ethnicity = [
    "ethnicity_african".tr,
    "ethnicity_asian".tr,
    "ethnicity_european".tr,
    "ethnicity_latin".tr,
    "ethnicity_native".tr,
    "ethnicity_mixed".tr,
    "ethnicity_prefer_not".tr,
    "ethnicity_self".tr,
  ];

  List<String> gender = [
    "gender_man".tr,
    "gender_women".tr,
    "gender_non_binary".tr,
    "gender_prefer_not".tr,
    "gender_self".tr
  ];

  List<String> sexualOrientation = [
    "sexual_hetero".tr,
    "sexual_gay".tr,
    "sexual_lesbian".tr,
    "sexual_bisexual".tr,
    "sexual_pansexual".tr,
    "sexual_prefer_not".tr,
    "sexual_self".tr
  ];

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "edit_profile".tr),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xFFE6EEF7),
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(()=>
                          Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF094EBE),
                                        Color(0xFF15AABA)
                                      ]
                                  )
                              ),
                              child: ClipOval(
                                child:  _profileController.profileImage.value != null? Image.file(_profileController.profileImage.value!,
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,): Image.asset('assets/image/user.png'),
                              )
                          ),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 4,
                        child: InkWell(
                          onTap: (){
                            _profileController.pickProfileImage(fromCamera: false);
                          },
                          child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset('assets/icons/camera.svg'),
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
            SizedBox(height: 16,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset('assets/icons/right.svg'),
                      ),
                      hintText: "enter_full_name".tr,
                    ),
                    SizedBox(height: 12,),
                    _publicRow(0),
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset('assets/icons/location.svg'),
                      ),
                      hintText: 'enter_location'.tr,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/location_fill.svg'),
                      ),
                    ),
                    SizedBox(height: 12,),
                    _publicRow(1),
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset('assets/icons/right.svg'),
                      ),
                      hintText: "write_profession".tr,
                    ),
                    SizedBox(height: 12,),
                    _publicRow(2),
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset('assets/icons/right.svg'),
                      ),
                      hintText: "add_bio".tr,
                    ),
                    SizedBox(height: 12,),
                    _publicRow(3),
                    SizedBox(height: 8,),
                    CustomTextField(
                      controller: nameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset('assets/icons/people.svg'),
                      ),
                      hintText: "enter_age".tr,
                    ),
                    SizedBox(height: 12,),
                    _publicRow(4),
                    SizedBox(height: 12,),
                    CustomDropdown(
                        options: gender,
                        title: 'enter_gender'.tr,
                        onChanged: (val){}),
                    SizedBox(height: 12,),
                    _publicRow(5),
                    SizedBox(height: 8,),
                    CustomDropdown(
                        options: ethnicity,
                        title: 'select_ethnicity'.tr,
                        onChanged: (val){}),
                    SizedBox(height: 12,),
                    _publicRow(6),
                    SizedBox(height: 8,),
                    CustomDropdown(
                        title: 'sexual_orientation'.tr,
                        options: sexualOrientation,
                        onChanged: (val){}),
                    SizedBox(height: 8,),
                    _publicRow(7),
                    SizedBox(height: 36,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                          color: Color(0xFFE6EEF7),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/bio.svg'),
                              SizedBox(width: 12,),
                              Text("bio".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textColor
                                ),),
                            ],
                          ),
                          SizedBox(height: 12,),
                          CustomTextField(
                            maxLines: 5,
                            hintText: 'write_here'.tr,
                            controller: nameController,
                            filColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 33,),
                    CustomButton(onTap: (){},
                        text: "edit_profile".tr),
                    SizedBox(height: 20,)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

   _publicRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("public".tr,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
          ),),
        SizedBox(width: 8,),
        CustomRadioButton(
            value: isCheck[index],
            onChanged: (value){
              setState(() {
                isCheck[index] = value;
              });
            })
      ],
    );
  }
}
