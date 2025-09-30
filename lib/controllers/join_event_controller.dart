import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/utils/image_utils.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

class JoinEventController extends GetxController{

  final isJoinEventLoading = false.obs;

  Rx<File?> bannerImage = Rx<File?>(null);

  Future<void> pickBannerImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      bannerImage.value = pickedFile;
    }

  }


  Future<void> joinEvent({
    required String bannerImage,
    required List<String> eventType,
    required String eventTitle,
    required String eventDescription,
    required String date,
    required String eventTime,
    required String location,
    required List<String> pace,
    required String participants,
    required List<String> language,
    required int price,

})async{
    isJoinEventLoading(true);

    List<MultipartBody> multipartBody = [];
    if(bannerImage.isNotEmpty){
      multipartBody.add(MultipartBody('photo_banner', File(bannerImage)));
    }

    Map<String, String> payload = {
      "event_type": eventType.join(','),
      "title":eventTitle,
      "description": eventDescription,
      "language": language.join(','),
      "date": date,
      "time": eventTime,
      "location":location,
      "pace": pace.join(','),
      "max_participants": participants,
      "cost": price.toString(),
    };

    final response = await ApiClient.postMultipartData(ApiConstant.addEventEndPoint,
        payload, multipartBody: multipartBody);

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.back();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isJoinEventLoading(false);

  }

}