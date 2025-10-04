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
  WidgetsBinding.instance.addPostFrameCallback((_){
    _communityController.fetchAllCommunityTopics();
    _communityController.fetchAllCommunityPosts();
  });
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
      body: Obx(()=> _communityController.isCommunityPostLoading.value?
          Center(child: CustomPageLoading(),): Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [

              SizedBox(
                height: 36,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                  itemCount: _communityController.communityTopics.length,
                    itemBuilder: (context, index){
                      final topic = _communityController.communityTopics[index];
                  return InkWell(
                    onTap: (){
                      _communityController.fetchTopicWishPosts(id: topic.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: _customCategories(textKey: topic.name)
                    ),
                  );
                }),
              ),

              const SizedBox(height: 26),

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
                                   post.isLiked?  const Icon(
                                     Icons.favorite,
                                     color: Colors.red,
                                   ): Icon(Icons.favorite_border,
                                    color: Color(0xFF545454)),
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
                     itemCount: _communityController.communityPosts.value.length)),
              CustomButton(
                  onTap: () {
                    Get.to(() => CreatePostScreen());
                  },
                  text: "create_a_post".tr)
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(1),
    );
  }

 Widget _customCategories({required String textKey}) {
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
