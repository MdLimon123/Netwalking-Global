import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/utils/image_utils.dart';

class CoachProfileSetupProfile extends GetxController{


  Rx<File?> coachImageFile = Rx<File?>(null);

  Future<void> pickCoachImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      coachImageFile.value = pickedFile;
    }

  }

}