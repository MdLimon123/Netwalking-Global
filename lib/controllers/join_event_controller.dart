import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/models/all_event_model.dart';
import 'package:netwalking_global/models/my_event_model.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/utils/image_utils.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/AllTabsScreen/Widgets/all_event_screen.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/AllTabsScreen/Widgets/my_event_screen.dart';

class JoinEventController extends GetxController{

  final isJoinEventLoading = false.obs;

  final isMyEventLoading = false.obs;

  final  isAllEventLoading = false.obs;

  RxList<MyEventData> myEventList = <MyEventData>[].obs;
  RxList<AllEventData> allEventList = <AllEventData>[].obs;

  var tabIndex = 0.obs;
  Rx<File?> bannerImage = Rx<File?>(null);

  List<String> tabList = [
    'All Event',
    'My Event',
  ].obs;

  List<Widget> tabSections = [
    AllEventScreen(),
    MyEventScreen(),
  ].obs;

  bool isTabSelected(int index){
    if(tabIndex == index){
      return true;
    }
    return false;
  }

  Future<void> pickBannerImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      bannerImage.value = pickedFile;
    }

  }


  Future<void> fetchAllEvent()async{
    isAllEventLoading(true);

    final response = await ApiClient.getData(ApiConstant.allEventEndPoint);

    if(response.statusCode == 200 || response.statusCode == 201){
      AllEventModel allEventModel = AllEventModel.fromJson(response.body);
      allEventList.value = allEventModel.data;

    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isAllEventLoading(false);
  }


  Future<void> fetchMyEvent()async{

    isMyEventLoading(true);

    final response = await ApiClient.getData(ApiConstant.myEventEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      MyEventModel myEventModel = MyEventModel.fromJson(response.body);
      myEventList.value = myEventModel.data;

    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isMyEventLoading(false);

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