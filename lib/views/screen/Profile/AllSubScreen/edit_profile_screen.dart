import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_radio_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  bool isSwitch = false;
  List<bool> isCheck = List.generate(11, (_) => false);

  List<String> ethnicity = [
    "African / African descent",
    "Asian / South Asian",
    "European",
    "Latin American / Hispanic",
    "Indigenous / Native",
    "Mixed ethnic background",
    "Prefer not to say",
    "Self-describe",
  ];

  List<String> gender = [
    "Man",
    "Women",
    "Non-binary",
    "Prefer not to say",
    "Self-describe"
  ];
  List<String> sexualOrientation = [
    "Heterosexual / Straight",
    "Gay",
    "Lesbian",
    "Bisexual",
    "Pansexual",
    "Prefer not to say",
    "Self-describe"
  ];




  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Edit Profile"),
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
                        child: Image.asset('assets/image/user.png'),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 4,
                        child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset('assets/icons/camera.svg'),
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,)
                  // SizedBox(height: 20,),
                  // Text("Set Up Your Profile",
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w600,
                  //       color: AppColors.textColor
                  //   ),),
                  // SizedBox(height: 8,),
                  // Text("Tell us about yourself to connect better",
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w400,
                  //       color: AppColors.textColor
                  //   ),),
                  // SizedBox(height: 10,)
                ],
              ),
            ),


            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(controller: nameController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/right.svg'),
                    ),
                    hintText: "Enter your full name",),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[0],
                          onChanged: (value){
                            setState(() {
                              isCheck[0] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(controller: nameController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset('assets/icons/location.svg'),
                    ),
                    hintText: 'Input your location (Optional)',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/location_fill.svg'),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[1],
                          onChanged: (value){
                            setState(() {
                              isCheck[1] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/right.svg'),
                    ),
                    hintText: "Write your profession (Optional)",
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[2],
                          onChanged: (value){
                            setState(() {
                              isCheck[3] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/right.svg'),
                    ),
                    hintText: "Add Bio (Optional)",
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[3],
                          onChanged: (value){
                            setState(() {
                              isCheck[3] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/people.svg'),
                    ),
                    hintText: "Enter your age (Optional)",
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[4],
                          onChanged: (value){
                            setState(() {
                              isCheck[4] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomDropdown(
                      options: gender,
                      title: 'Enter your gender',
                      onChanged: (val){

                      }),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[5],
                          onChanged: (value){
                            setState(() {
                              isCheck[5] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomDropdown(
                      options: ethnicity,
                      title: 'Select your ethnicity (optional)',
                      onChanged: (val){

                      }),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[6],
                          onChanged: (value){
                            setState(() {
                              isCheck[6] = value;
                            });

                          })
                    ],
                  ),
                  SizedBox(height: 8,),
                  CustomDropdown(
                      title: 'Sexual Orientation',
                      options: sexualOrientation,
                      onChanged: (val){

                      }),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Public",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor
                        ),),
                      SizedBox(width: 8,),
                      CustomRadioButton(
                          value: isCheck[7],
                          onChanged: (value){
                            setState(() {
                              isCheck[7] = value;
                            });

                          })
                    ],
                  ),
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
                            Text("Bio",
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
                          hintText: 'Write here',
                          controller: nameController,
                          filColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 33,),
                  CustomButton(onTap: (){

                  },
                      text: "Edit Profile"),
                  SizedBox(height: 20,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
