import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "search".tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: searchController,
              hintText: 'search_placeholder'.tr,
              filColor: Colors.white,
              onTap: () {},
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() => FilterScreen());
                  },
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _customCategories(textKey: "#Clean Up ".tr),
                SizedBox(width: 16),
                _customCategories(textKey: "#Dog Walk ".tr),
                SizedBox(width: 16),
                _customCategories(textKey: "#Mindful Walk".tr),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "matches".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset(
                                'assets/icons/show.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "morning_walking".tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            "today_8".tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "with_group".tr,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 32,
                              width: 90,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundImage:
                                      AssetImage("assets/image/profile.jpg"),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundImage:
                                      AssetImage("assets/image/profile.jpg"),
                                    ),
                                  ),
                                  Positioned(
                                    left: 40,
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE59A2F),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "12+",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              "message_now".tr,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _customCategories({required String textKey}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        textKey,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
