
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/controllers/profile_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_radio_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _profileController = Get.put(ProfileController());
  final _dataController = Get.put(DataController());

  bool isSwitch = false;

  Map<String, String> genderMap = {
    "Male": "Male",
    "Female": "Female",
    "Non-binary": "Non-binary",
    "Prefer not": "Prefer not",
    "Self": "Self",
  };

  Map<String, String> ethnicityMap = {
    "African": "African",
    "Asian": "Asian",
    "European": "European",
    "Latin": "Latin",
    "Native": "Native",
    "Mixed": "Mixed",
    "Prefer not": "Prefer not",
    "Self": "Self",
  };

  Map<String, String> orientationMap = {
    "Heterosexual": "Heterosexual",
    "Gay": "Gay",
    "Lesbian": "Lesbian",
    "Bisexual": "Bisexual",
    "Pansexual": "Pansexual",
    "Prefer not": "Prefer not",
    "Self": "Self",
  };



  List<bool> isCheck = List.generate(11, (_) => false);

  @override
  void initState() {
    super.initState();

    _dataController.getUserData().then((_) {
      _profileController.nameController.text = _dataController.name.value;
      _profileController.locationController.text = _dataController.location.value;
      _profileController.professionController.text = _dataController.profession.value;
      _profileController.bioController.text = _dataController.bio.value;
      _profileController.ageController.text = _dataController.age.value.toString();

      _profileController.selectedGender.value =
          genderMap[_dataController.gender.value] ?? '';

      _profileController.selectedEthnicity.value =
          ethnicityMap[_dataController.ethnicity.value] ?? '';

      _profileController.selectedOrientation.value =
          orientationMap[_dataController.sexualOrientation.value] ?? '';



      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    print("${_dataController.gender}");

    return Scaffold(
      appBar: CustomAppbar(title: "edit_profile".tr),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Profile Image
            Container(
              width: double.infinity,
              color: Color(0xFFE6EEF7),
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(() => Container(
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
                                ])),
                        child: ClipOval(
                          child: _profileController.profileImage.value != null
                              ? Image.file(
                            _profileController.profileImage.value!,
                            fit: BoxFit.cover,
                            height: 90,
                            width: 90,
                          )
                              : CustomNetworkImage(
                            imageUrl: _dataController.profileImage.value,
                            boxShape: BoxShape.circle,
                            height: 90,
                            width: 90,
                          ),
                        ),
                      )),
                      Positioned(
                        right: 1,
                        bottom: 4,
                        child: InkWell(
                          onTap: () {
                            _profileController.pickProfileImage(fromCamera: false);
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration:
                            BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset('assets/icons/camera.svg'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Name
                  CustomTextField(
                    controller: _profileController.nameController,
                    onChanged: (val) => _profileController.nameController.text = val,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/right.svg'),
                    ),
                  ),
                  SizedBox(height: 12),
                  _publicRow(0),

                  // Location
                  CustomTextField(
                    controller: _profileController.locationController,
                    onChanged: (val) => _profileController.locationController.text = val,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset('assets/icons/location.svg'),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/location_fill.svg'),
                    ),
                  ),
                  SizedBox(height: 12),
                  _publicRow(1),

                  // Profession
                  CustomTextField(
                    controller: _profileController.professionController,
                    onChanged: (val) => _profileController.professionController.text = val,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/right.svg'),
                    ),
                  ),
                  SizedBox(height: 12),
                  _publicRow(2),

                  // Bio
                  // CustomTextField(
                  //   controller: _profileController.bioController,
                  //   onChanged: (val) => _profileController.bioController.text = val,
                  //   prefixIcon: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: SvgPicture.asset('assets/icons/right.svg'),
                  //   ),
                  // ),
                  // SizedBox(height: 12),
                  // _publicRow(3),

                  // Age
                  CustomTextField(
                    controller: _profileController.ageController,
                    onChanged: (val) => _profileController.ageController.text = val,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset('assets/icons/people.svg'),
                    ),
                  ),
                  SizedBox(height: 12),
                  _publicRow(3),

                  // Gender dropdown
                  CustomDropdown(
                      options: genderMap.values.toList(),
                      title: 'enter_gender'.tr,
                      onChanged: (val){
                        String? backendKey = genderMap.entries
                            .firstWhere((e) => e.value == val, orElse: () => MapEntry('', ''))
                            .key;
                        _profileController.selectedGender.value = backendKey;
                      }
                  ),
                  SizedBox(height: 12),
                  _publicRow(4),

                  // Ethnicity dropdown
                  CustomDropdown(
                    options: ethnicityMap.values.toList(),
                    title: 'select_ethnicity'.tr,
                    onChanged: (val) => _profileController.selectedEthnicity.value = val,
                  ),
                  SizedBox(height: 12),
                  _publicRow(5),

                  // Sexual Orientation dropdown
                  CustomDropdown(
                    options: orientationMap.values.toList(),
                    title: 'sexual_orientation'.tr,
                    onChanged: (val) => _profileController.selectedOrientation.value = val,
                  ),
                  SizedBox(height: 12),
                  _publicRow(6),

                  SizedBox(height: 36),
                  // Bio section box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        color: Color(0xFFE6EEF7),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/bio.svg'),
                            SizedBox(width: 12),
                            Text(
                              "bio".tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        CustomTextField(
                          maxLines: 5,
                          hintText: 'write_here'.tr,
                          controller: _profileController.bioController,
                          onChanged: (val) => _profileController.bioController.text = val,
                          filColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  _publicRow(7),
                  SizedBox(height: 33),

                  // Submit button
                  Obx(
                        () => CustomButton(
                      loading: _profileController.isUpdateLoading.value,
                      onTap: () {
                        _profileController.submitProfile(
                            profileImage:
                            _profileController.profileImage.value?.path ?? '');
                      },
                      text: "edit_profile".tr,
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
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
        Text(
          "public".tr,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textColor),
        ),
        SizedBox(width: 8),
        Obx(() => CustomRadioButton(
          value: _profileController.isCheck[index],
          onChanged: (value) {
            _profileController.isCheck[index] = value;
          },
        ))
      ],
    );
  }
}
