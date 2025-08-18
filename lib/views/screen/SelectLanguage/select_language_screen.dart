import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/language_controller.dart';
import 'package:netwalking_global/controllers/localization_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/models/language_model.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/utils/app_constants.dart';
import 'package:netwalking_global/utils/style.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

  final _languageController = Get.put(LanguageController());
  final _localizationController = Get.find<LocalizationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFE6EEF7)
              ),
              child: Center(
                child: SvgPicture.asset('assets/icons/language.svg'),
              ),
            ),
            SizedBox(height: 36,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Choose Your Language",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 4,),
                    Text("Select your preferred language to get started",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                      ),),
                    SizedBox(height: 10,),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dropdown header
                            GestureDetector(
                              onTap: () => _languageController.isExpanded.toggle(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE6EEF7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _languageController.selectedLanguage.value,
                                      style: AppStyles.h3(color: const Color(0xFF000000)),
                                    ),
                                    Icon(
                                      _languageController.isExpanded.value
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: const Color(0xFF9CA3AF),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Expanded dropdown content
                            if (_languageController.isExpanded.value) ...[
                              const SizedBox(height: 4),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFFD1D5DB)),
                                ),
                                child: Column(
                                  children: [

                                    Obx(() {
                                      return Column(
                                        children: _languageController.filteredLanguages.map((lang) {

                                          bool isSelected = _languageController.selectedLanguage.value == lang.tr;

                                          return GestureDetector(
                                            onTap: () {
                                              _languageController.selectLanguage(lang.tr);
                                              LanguageModel? selectedLangModel = AppConstants.languages.firstWhere(

                                                    (language) => language.languageName == lang,
                                                orElse: () => AppConstants.languages[0],
                                              );
                                              _localizationController.setLanguage(
                                                Locale(selectedLangModel.languageCode, selectedLangModel.countryCode),

                                              );
                                              _languageController.isExpanded.value = false;
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                              ),
                                              child: ListTile(
                                                title: Text(
                                                  lang.tr, // Adjusted if lang is a key
                                                  style: AppStyles.h3(color: const Color(0xFF4B5563)),
                                                ),
                                                trailing: isSelected
                                                    ? Icon(Icons.check_circle, color: AppColors.primaryColor)
                                                    : Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border:
                                                    Border.all(color: const Color(0xFFD1D5DB), width: 1),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color(0xFF12110D).withValues(alpha: 0.12),
                                                        blurRadius: 20,
                                                        offset: const Offset(0, 4),
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    })

                                  ],
                                ),
                              ),
                            ]
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                Get.offAllNamed(AppRoutes.loginScreen);
              },
              child: Container(
                height: 52,
                margin: EdgeInsets.only(bottom: 10),
                width: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF094EBE),
                      Color(0xFF15AABA)

                    ]
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
