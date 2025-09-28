import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/utils/image_utils.dart';

class SetupProfileController extends GetxController{

  Rx<File?> imageFile = Rx<File?>(null);

  Future<void> pickImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      imageFile.value = pickedFile;
    }

  }

}