import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/community_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/bottom_menu..dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_time_date_event.dart';
import 'package:netwalking_global/views/screen/Community/AllSubScreen/community_details_screen.dart';
import 'package:netwalking_global/views/screen/Community/AllSubScreen/create_post_screen.dart';
import 'package:netwalking_global/views/screen/Notification/notification_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {


  final _communityController = Get.put(CommunityController());
  @override
  void initState() {
   _communityController.fetchAllCommunityPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "community".tr,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: SvgPicture.asset('assets/icons/notification.svg')),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _customCategories(textKey: "biodiversity_awareness"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "eco_conscious_living"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "projects"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "resilience_hubs"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "skill_sharing"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "professional_growth"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "professional_networking"),
                  const SizedBox(width: 8),
                  _customCategories(textKey: "wellness"),
                ],
              ),
            ),
            const SizedBox(height: 26),
           Obx(()=> _communityController.isCommunityPostLoading.value?
           Center(child: CustomPageLoading()):
           Expanded(
               child: ListView.separated(
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemBuilder: (context, index) {
                     final post = _communityController.communityPosts.value[index];
                     return InkWell(
                       onTap: () {
                         Get.to(() => CommunityDetailsScreen(
                           id: post.id,
                         ));
                       },
                       child: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                         width: double.infinity,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8),
                             border: Border.all(color: const Color(0xFFE6E6E6), width: 1)),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [

                                 CustomNetworkImage(
                                     imageUrl: post.image,
                                     boxShape: BoxShape.circle,
                                     height: 32,
                                     width: 32),

                          
                                 const SizedBox(width: 8),
                                 Text(
                                   post.userName,
                                   style: const TextStyle(
                                     color: Color(0xFF545454),
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                   ),
                                 ),
                                 const SizedBox(width: 14),
                                 SvgPicture.asset('assets/icons/clock.svg'),
                                 const SizedBox(width: 4),
                                 Text(
                                   customTimeDateEvent(post.createdAt.toString()),
                                   style: const TextStyle(
                                     color: Color(0xFF545454),
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                   ),
                                 )
                               ],
                             ),
                             const SizedBox(height: 12),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Expanded(
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         post.title ?? "",
                                         style: TextStyle(
                                           color: AppColors.textColor,
                                           fontSize: 16,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                       SizedBox(height: 5,),
                                       Text(
                                         post.content ?? "",
                                         style: TextStyle(
                                           color: AppColors.textColor,
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),

                                 CustomNetworkImage(
                                     imageUrl: post.postImage.toString(),
                                     borderRadius: BorderRadius.circular(8),
                                     height: 60,
                                     width: 60),


                               ],
                             ),
                             const SizedBox(height: 10),
                             Row(
                               children: [
                                 const Icon(
                                   Icons.favorite,
                                   color: Colors.red,
                                 ),
                                 Text(
                                   post.likesCount.toString(),
                                   style: TextStyle(
                                     color: AppColors.textColor,
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                   ),
                                 ),
                                 const SizedBox(width: 15),
                                 SvgPicture.asset('assets/icons/comment.svg'),
                                 Text(
                                   post.commentsCount.toString(),
                                   style: TextStyle(
                                     color: AppColors.textColor,
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                   ),
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),
                     );
                   },
                   separatorBuilder: (_, index) => const SizedBox(height: 10),
                   itemCount: _communityController.communityPosts.value.length))),
            CustomButton(
                onTap: () {
                  Get.to(() => CreatePostScreen());
                },
                text: "create_a_post".tr)
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(1),
    );
  }

  _customCategories({required String textKey}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      height: 34,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Text(
        textKey.tr,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
