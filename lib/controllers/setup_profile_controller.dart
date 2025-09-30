import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/utils/image_utils.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

class SetupProfileController extends GetxController{

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final professionController = TextEditingController();
  final bioController = TextEditingController();
  final ageController = TextEditingController();

  var selectedDisabilities = <String>[].obs;

  var walkingAvailability = ''.obs;  // RxString
  var walkingDistance    = ''.obs;   // RxString
  var paceSelection      = ''.obs;

  var isWalkingLoading = false.obs;

  final selectedGender = RxnString();
  final selectedEthnicity = RxnString();
  final selectedOrientation = RxnString();

  final _dataController = Get.put(DataController());

  final isSubmitLoading = false.obs;

  final isAccessLoading = false.obs;
  var isCheck = List.generate(8, (_) => false).obs;


  Rx<File?> imageFile = Rx<File?>(null);

  Future<void> pickImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      imageFile.value = pickedFile;
    }

  }

  //
  // Future<void> submitProfile({required String profileImage,})async{
  //
  //   isSubmitLoading(true);
  //
  //   final Map<String, bool> privateFieldsMap = {
  //     "full_name": !isCheck[0],
  //     "location": !isCheck[1],
  //     "profession": !isCheck[2],
  //     "bio": !isCheck[3],
  //     "age": !isCheck[4],
  //     "gender": !isCheck[5],
  //     "ethnicity": !isCheck[6],
  //     "sexual_orientation": !isCheck[7],
  //   };
  //
  //   final Map<String, String> body = {};
  //
  //   void addIfNotEmpty(String key, String? value){
  //     if(value != null && value.trim().isNotEmpty){
  //       body[key] = value.trim();
  //     }
  //   }
  //
  //   addIfNotEmpty("full_name", nameController.text);
  //   addIfNotEmpty("location", locationController.text);
  //   addIfNotEmpty("profession", professionController.text);
  //   addIfNotEmpty("bio", bioController.text);
  //   addIfNotEmpty("age", ageController.text);
  //   addIfNotEmpty("gender", selectedGender.value);
  //   addIfNotEmpty("ethnicity", selectedEthnicity.value);
  //   addIfNotEmpty("sexual_orientation", selectedOrientation.value);
  //
  //   body['private_fields'] = jsonEncode(privateFieldsMap);
  //
  //
  //
  //   List<MultipartBody> multipartBody = [];
  //   if (profileImage.isNotEmpty) {
  //     multipartBody.add(MultipartBody('image', File(profileImage)));
  //   }
  //
  //   print(" body ===============> $body");
  //
  //   final response = await ApiClient.patchMultipartData(ApiConstant.profileSetupEndPoint,
  //       {"data":jsonEncode(body)}, multipartBody: multipartBody);
  //   print("response body ===============> ${response.body}");
  //   if(response.statusCode == 200 || response.statusCode == 201){
  //     final data = jsonDecode(response.body);
  //     showCustomSnackBar(data['message'], isError: false);
  //     Get.offAllNamed(AppRoutes.disabilityAccessibilityScreen);
  //   }else{
  //     showCustomSnackBar("Something went wrong", isError: true);
  //
  //   }
  //   isSubmitLoading(false);
  //
  //
  // }

  Future<void> submitProfile({required String profileImage}) async {
    isSubmitLoading(true);

    final Map<String, bool> privateFieldsMap = {
      "full_name": !isCheck[0],
      "location": !isCheck[1],
      "profession": !isCheck[2],
      "bio": !isCheck[3],
      "age": !isCheck[4],
      "gender": !isCheck[5],
      "ethnicity": !isCheck[6],
      "sexual_orientation": !isCheck[7],
    };

    final Map<String, String> body = {};

    void addIfNotEmpty(String key, String? value) {
      if (value != null && value.trim().isNotEmpty) {
        body[key] = value.trim();
      }
    }

    addIfNotEmpty("full_name", nameController.text);
    addIfNotEmpty("location", locationController.text);
    addIfNotEmpty("profession", professionController.text);
    addIfNotEmpty("bio", bioController.text);
    addIfNotEmpty("age", ageController.text);
    addIfNotEmpty("gender", selectedGender.value);
    addIfNotEmpty("ethnicity", selectedEthnicity.value);
    addIfNotEmpty("sexual_orientation", selectedOrientation.value);

    body['private_fields'] = jsonEncode(privateFieldsMap);

    List<MultipartBody> multipartBody = [];
    if (profileImage.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(profileImage)));
    }

    debugPrint("Request body ===============> $body");

    try {
      final response = await ApiClient.patchMultipartData(
        ApiConstant.profileSetupEndPoint,
        {"data": jsonEncode(body)},
        multipartBody: multipartBody,
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Raw Response body: ${response.body}");


      Map<String, dynamic> responseData = {};
      if (response.body.isNotEmpty) {
        responseData = jsonDecode(response.body);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        showCustomSnackBar(responseData['message'] ?? "Success", isError: false);
        Get.offAllNamed(AppRoutes.disabilityAccessibilityScreen);
      } else {
        showCustomSnackBar(
          responseData['message'] ?? "Something went wrong",
          isError: true,
        );
      }
    } catch (e) {
      debugPrint("Submit Profile Error: $e");
      showCustomSnackBar("Something went wrong", isError: true);
    } finally {
      isSubmitLoading(false);
    }
  }

  Future<void> submitAccessibility({required List<String> selectedDisability,}) async {
    isAccessLoading(true);

    final Map<String, String> formData = {
      "data": jsonEncode({
        "neurotypes": jsonEncode(selectedDisability),
        "hasAccessibilityRequirement": selectedDisability.isNotEmpty,

      }),
    };

    final response = await ApiClient.patchMultipartData(
      ApiConstant.profileSetupEndPoint,
      formData,
      multipartBody: [],
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      print("Response body ==========> ${response.body}");

      final data = jsonDecode(response.body);
      showCustomSnackBar(data['message'], isError: false);
      Get.offAllNamed(AppRoutes.setYourWalkingPrefereneesScreen);
    } else {
      showCustomSnackBar("Something went wrong", isError: true);
    }

    isAccessLoading(false);
  }

  Future<void> submitWalkingPreferences() async {
    isWalkingLoading(true);

    final Map<String, String> formData = {
      "data": jsonEncode({
        "walking_availability": walkingAvailability.value,
        "waking_distance": walkingDistance.value,
        "pace_selection": paceSelection.value,
      }),
    };

    final response = await ApiClient.patchMultipartData(
      ApiConstant.profileSetupEndPoint,
      formData,
      multipartBody: [],
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await _dataController.setUserData(data['data'] ?? {});
      showCustomSnackBar(data['message'], isError: false);
      Get.offAllNamed(AppRoutes.completeScreen);
    } else {
      showCustomSnackBar("Something went wrong", isError: true);
    }

    isWalkingLoading(false);
  }


  @override
  void onClose() {
    nameController.dispose();
    locationController.dispose();
    professionController.dispose();
    bioController.dispose();
    ageController.dispose();

    super.onClose();
  }


}