import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/community_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_network_image.dart';
import 'package:netwalking_global/views/base/custom_page_loading.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommunityDetailsScreen extends StatefulWidget {

  final int id;

  const CommunityDetailsScreen({super.key, required this.id});

  @override
  State<CommunityDetailsScreen> createState() => _CommunityDetailsScreenState();
}

class _CommunityDetailsScreenState extends State<CommunityDetailsScreen> {
  final sendController = TextEditingController();

  final _communityController = Get.put(CommunityController());

  String getTimeAgo(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return timeago.format(date);
  }

  @override
  void initState() {
  _communityController.fetchSinglePostDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "community_details".tr),
      // body: Obx(()=>
      // _communityController.isSinglePostDetailsLoading.value?
      // Center(child: CustomPageLoading()):
      //
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      //       child: Text(
      //         "post_details".tr,
      //         style: TextStyle(
      //           color: AppColors.textColor,
      //           fontSize: 16,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: Container(
      //           padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             color: Color(0xFFFFFFFF),
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(8),
      //               topRight: Radius.circular(8),
      //             ),
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Row(
      //                 children: [
      //
      //                   CustomNetworkImage(
      //                       imageUrl: _communityController.singlePostList[0].image,
      //                       boxShape: BoxShape.circle,
      //                       height: 36,
      //                       width: 36),
      //
      //                   Container(
      //                     height: 36,
      //                     width: 36,
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       image: DecorationImage(
      //                         image: AssetImage('assets/image/profile.jpg'),
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(width: 8),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(getTimeAgo(_communityController.singlePostList[0].createdAt.toString()),
      //                           style: TextStyle(
      //                               color: Color(0xFF545454),
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w400)),
      //                       SizedBox(height: 4),
      //                       Text(_communityController.singlePostList[0].userName,
      //                           style: TextStyle(
      //                               color: Color(0xFF545454),
      //                               fontSize: 16,
      //                               fontWeight: FontWeight.w500)),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //               SizedBox(height: 16),
      //               Text(_communityController.singlePostList[0].title,
      //                   style: TextStyle(
      //                       color: AppColors.textColor,
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w500)),
      //               SizedBox(height: 8),
      //               Text(
      //                 _communityController.singlePostList[0].content,
      //                 style: TextStyle(
      //                     color: Color(0xFF545454),
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w400),
      //               ),
      //               SizedBox(height: 8),
      //
      //               CustomNetworkImage(
      //                   imageUrl: _communityController.singlePostList[0].postImage,
      //                   height: 154,
      //                   width: double.infinity),
      //
      //               SizedBox(height: 20),
      //               Row(
      //                 children: [
      //                   Icon(Icons.favorite, color: Colors.red),
      //                   SizedBox(width: 4),
      //                   Text(_communityController.singlePostList[0].likesCount.toString(),
      //                       style: TextStyle(
      //                           color: AppColors.textColor,
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w400)),
      //                   SizedBox(width: 15),
      //                   SvgPicture.asset('assets/icons/comment.svg'),
      //                   SizedBox(width: 4),
      //                   Text(_communityController.singlePostList[0].commentsCount.toString(),
      //                       style: TextStyle(
      //                           color: AppColors.textColor,
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w400)),
      //                 ],
      //               ),
      //               SizedBox(height: 12),
      //               Text("comment".tr,
      //                   style: TextStyle(
      //                       color: AppColors.textColor,
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w600)),
      //               SizedBox(height: 20),
      //               ListView.separated(
      //                   shrinkWrap: true,
      //                   physics: NeverScrollableScrollPhysics(),
      //                   itemBuilder: (context, index) {
      //                     final comment = _communityController.singlePostList[0].comments[index];
      //                     return Row(
      //                       children: [
      //
      //                         CustomNetworkImage(
      //                             imageUrl: comment.image,
      //                             height: 28,
      //                             boxShape: BoxShape.circle,
      //                             width: 28),
      //                         SizedBox(width: 12),
      //                         Expanded(
      //                           child: Container(
      //                             width: double.infinity,
      //                             padding: EdgeInsets.all(8),
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(16),
      //                               color: Color(0xFFEFF9EE),
      //                             ),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                               CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(getTimeAgo(comment.createdAt.toString()),
      //                                     style: TextStyle(
      //                                         color: Color(0xFF545454),
      //                                         fontSize: 14,
      //                                         fontWeight: FontWeight.w400)),
      //                                 SizedBox(height: 4),
      //                                 Text(comment.userName,
      //                                     style: TextStyle(
      //                                         color: AppColors.textColor,
      //                                         fontSize: 16,
      //                                         fontWeight: FontWeight.w500)),
      //                                 SizedBox(height: 8),
      //                                 Text(
      //                                   comment.content,
      //                                   style: TextStyle(
      //                                       color: Color(0xFF272727),
      //                                       fontSize: 14,
      //                                       fontWeight: FontWeight.w400),
      //                                 )
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     );
      //                   },
      //                   separatorBuilder: (_, index) => SizedBox(height: 16),
      //                   itemCount: _communityController.singlePostList[0].comments.length)
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //       decoration: BoxDecoration(
      //         color: Color(0xFFFFFFFF),
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(8),
      //           topRight: Radius.circular(8),
      //         ),
      //       ),
      //       child: Row(
      //         children: [
      //           Expanded(
      //             child: CustomTextField(
      //               controller: sendController,
      //               hintText: "send_message".tr,
      //             ),
      //           ),
      //           SizedBox(width: 8),
      //           Container(
      //             height: 35,
      //             width: 72,
      //             decoration: BoxDecoration(
      //               gradient: LinearGradient(
      //                 colors: [Color(0xFF094EBE), Color(0xFF15AABA)],
      //               ),
      //               borderRadius: BorderRadius.circular(8),
      //             ),
      //             child: Center(
      //               child: Icon(Icons.send, color: Colors.white, size: 20),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // )),

        body: Obx(() {
          if (_communityController.isSinglePostDetailsLoading.value) {
            return Center(child: CustomPageLoading());
          }

          if(_communityController.singlePost.value == null){
            return Center(child: Text("No data found"));
          }

          final post = _communityController.singlePost.value!;


          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Text(
                  "post_details".tr,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomNetworkImage(
                              imageUrl: post.image,
                              boxShape: BoxShape.circle,
                              height: 36,
                              width: 36,
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getTimeAgo(post.createdAt.toString()),
                                  style: TextStyle(
                                    color: Color(0xFF545454),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  post.userName,
                                  style: TextStyle(
                                    color: Color(0xFF545454),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          post.title,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Text(
                          post.content,
                          style: TextStyle(
                              color: Color(0xFF545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 8),
                        CustomNetworkImage(
                          imageUrl: post.postImage,
                          height: 154,
                          width: double.infinity,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 4),
                            Text(
                              post.likesCount.toString(),
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: 15),
                            SvgPicture.asset('assets/icons/comment.svg'),
                            SizedBox(width: 4),
                            Text(
                              post.commentsCount.toString(),
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          "comment".tr,
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final comment = post.comments[index];
                            return Row(
                              children: [
                                CustomNetworkImage(
                                  imageUrl: comment.image,
                                  height: 28,
                                  boxShape: BoxShape.circle,
                                  width: 28,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xFFEFF9EE),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTimeAgo(comment.createdAt.toString()),
                                          style: TextStyle(
                                            color: Color(0xFF545454),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          comment.userName,
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          comment.content,
                                          style: TextStyle(
                                            color: Color(0xFF272727),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(height: 16),
                          itemCount: post.comments.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom input
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: sendController,
                        hintText: "send_message".tr,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 35,
                      width: 72,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF094EBE), Color(0xFF15AABA)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.send, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        })

    );
  }
}
