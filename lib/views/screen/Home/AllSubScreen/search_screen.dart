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
      appBar: CustomAppbar(title: "Search"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
                controller: searchController,
                onTap: (){

                },
                hintText: 'Search walk partner or events...',
                filColor: Colors.white,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Get.to(()=> FilterScreen());
                    },
                      child: SvgPicture.asset('assets/icons/filter.svg')),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                )
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                _customCategories(textKey: "#Clean Up "),
                SizedBox(width: 16,),
                _customCategories(textKey: "#Dog Walk "),
                SizedBox(width: 16,),
                _customCategories(textKey: "#Mindful Walk")
              ],
            ),
            SizedBox(height: 20,),
            Text("Matches",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
            SizedBox(height: 12,),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return  Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset('assets/icons/show.svg',
                                    fit: BoxFit.cover,),
                                ),
                                SizedBox(width: 8,),
                                Text("Morning Walking",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textColor
                                  ),)
                              ],
                            ),
                            SizedBox(height: 8,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Text("Today: 8.00",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor
                                ),),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "With group",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  height: 32,
                                  width: 90, //
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      // 1st avatar
                                      Positioned(
                                        left: 0,
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundImage: AssetImage("assets/image/profile.jpg"),
                                        ),
                                      ),
              
                                      // 2nd avatar (overlap)
                                      Positioned(
                                        left: 20,
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundImage: AssetImage("assets/image/profile.jpg"),
                                        ),
                                      ),
              
                                      // Badge (12+)
                                      Positioned(
                                        left: 40,
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE59A2F), // গোল্ডেন ব্যাকগ্রাউন্ড
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2), // border যেন সুন্দর লাগে
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
                                Text("Message Now",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      decoration: TextDecoration.underline
                                  ),)
                              ],
                            )
              
              
                          ],
                        )
                    );
                  },
                  separatorBuilder: (__, index)=> SizedBox(height: 8,),
                  itemCount: 10),
            )
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
          borderRadius: BorderRadius.circular(8)),
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
