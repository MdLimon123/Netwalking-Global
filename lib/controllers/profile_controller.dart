import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/utils/image_utils.dart';

class ProfileController extends GetxController{

  Rx<File?> profileImage = Rx<File?>(null);


  Future<void> pickProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      profileImage.value = pickedFile;
    }
  }

}