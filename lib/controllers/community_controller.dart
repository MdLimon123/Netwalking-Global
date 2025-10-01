import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/models/all_community_post_model.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

import '../utils/image_utils.dart';

class CommunityController extends GetxController{


   final isCommunityPostLoading = false.obs;

   Rx<List<AllCommunityPost>> communityPosts = Rx<List<AllCommunityPost>>([]);

  Rx<File?> postImageFile = Rx<File?>(null);

  Future<void> pickPostImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      postImageFile.value = pickedFile;
    }

  }

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


}