import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/utils/image_utils.dart';

class JoinEventController extends GetxController{

  Rx<File?> bannerImage = Rx<File?>(null);

  Future<void> pickBannerImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      bannerImage.value = pickedFile;
    }


  }

}