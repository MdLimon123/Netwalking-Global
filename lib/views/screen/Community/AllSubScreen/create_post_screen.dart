import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {

  final titleController = TextEditingController();


  List<String> categories = [
    "Biodiversity Awareness",
    "Eco-Conscious Living",
    "Projects",
    "Resilience Hubs",
    "Skill Sharing",
    "Professional Growth",
    "Professional Networking",
    "Wellness"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Create Post"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Text("Create New Post",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),
          SizedBox(height: 36,),
          CustomDropdownCheckbox(
              title: "Category",
              options: categories,
              showCheckbox: false,
              bgColor: Colors.white,
              onChanged: (val){

              }),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(height: 12,),
                CustomTextField(controller: titleController,
                borderColor: Color(0xFFB3CBE5),
                filColor: Colors.white,
                maxLines: 3,
                hintText: 'write here',)
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(height: 12,),
                CustomTextField(controller: titleController,
                  borderColor: Color(0xFFB3CBE5),
                  filColor: Colors.white,
                  maxLines: 3,
                  hintText: 'write here',)
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Image",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 42,
              width: 42,
              decoration: const BoxDecoration(
                color: Color(0xFF045962), // green background
                shape: BoxShape.circle,
              ),
              child:Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset("assets/icons/default_image.svg", color: Colors.white),
              ),
              ),

          ],
        ),
      ),
          SizedBox(height: 24,),
          CustomButton(onTap: (){},
              text: "Post Now")
        ],
      ),
    );
  }
}
