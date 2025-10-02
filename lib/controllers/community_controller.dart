import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/models/all_community_post_model.dart';
import 'package:netwalking_global/models/community_topic_model.dart';
import 'package:netwalking_global/models/single_post_details_model.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

import '../utils/image_utils.dart';

class CommunityController extends GetxController{


   final isCommunityPostLoading = false.obs;

   final isTopicLoading = false.obs;

   final isPostLoading = false.obs;

   final isSinglePostDetailsLoading = false.obs;

   Rx<List<AllCommunityPost>> communityPosts = Rx<List<AllCommunityPost>>([]);
   var communityTopics = <CommunityTopic>[].obs;

   Rxn<SinglePostModel> singlePost = Rxn<SinglePostModel>();


   Rx<File?> postImageFile = Rx<File?>(null);

  var id = 0.obs;

  Future<void> pickPostImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      postImageFile.value = pickedFile;
    }

  }

  /// Community Post
  Future<void> fetchAllCommunityPosts()async{

    isCommunityPostLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllCommunityEndPoint);

    if(response.statusCode == 200 || response.statusCode == 201){
      List<dynamic> data = response.body;

      communityPosts.value = data.map((e) => AllCommunityPost.fromJson(e)).toList();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);
    }
    isCommunityPostLoading(false);
  }

  /// Community Topic
 Future<void> fetchAllCommunityTopics()async{
    isTopicLoading(true);

    final response = await ApiClient.getData(ApiConstant.postTopicEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      id.value = data[0]['id'];
      communityTopics.value = data.map((e) => CommunityTopic.fromJson(e)).toList();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);
    }
    isTopicLoading(false);

 }

 /// Add New Post for Community

Future<void> addNewPost({required int id, required String postImage, required String title, required String content,})async{

    isPostLoading(true);
    List<MultipartBody> multipartBody = [];
    if(postImage.isNotEmpty){
      multipartBody.add(MultipartBody('post_image', File(postImage)));
    }

    Map<String, String> payload = {
      "topic": id.toString(),
      "title": title,
      "content":content
    };

    final response = await ApiClient.postMultipartData(ApiConstant.addNewPostEndPoint,
        payload,
        multipartBody: multipartBody);

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar("Post created successfully", isError: false);
      Get.back();
      fetchAllCommunityPosts();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);

    }
    isPostLoading(false);


}

Future<void> fetchSinglePostDetails({required int id}) async {
     isSinglePostDetailsLoading(true);

     final response = await ApiClient.getData(ApiConstant.singlePostDetails(id: id));
     if (response.statusCode == 200 || response.statusCode == 201) {
       final data = response.body['data'];

       singlePost.value = SinglePostModel.fromJson(data);

     } else {
       showCustomSnackBar("Something went wrong", isError: true);
     }

     isSinglePostDetailsLoading(false);
   }



}