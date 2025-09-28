import 'dart:io';

import 'package:get/get.dart';

import '../utils/image_utils.dart';

class CommunityController extends GetxController{


  Rx<File?> postImageFile = Rx<File?>(null);

  Future<void> pickPostImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      postImageFile.value = pickedFile;
    }

  }


}