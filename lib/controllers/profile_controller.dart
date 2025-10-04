import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/utils/image_utils.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

class ProfileController extends GetxController{

  final selectedGender = RxnString();
  final selectedEthnicity = RxnString();
  final selectedOrientation = RxnString();

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final professionController = TextEditingController();
  final bioController = TextEditingController();
  final ageController = TextEditingController();

  Rx<File?> profileImage = Rx<File?>(null);

  final isChangePasswordLoading = false.obs;

  var isCheck = List.generate(8, (_) => false).obs;

  final isUpdateLoading = false.obs;

  final _dataController = Get.put(DataController());


  Future<void> pickProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      profileImage.value = pickedFile;
    }
  }


  Future<void> submitProfile({required String profileImage}) async {
    isUpdateLoading(true);


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


    Map<String, String> genderMap = {
      "Man": "Male",
      "Woman": "Female",
      "Other": "Other",
    };
    Map<String, String> ethnicityMap = {
      "Asian / South Asian": "Asian",
      "Caucasian / White": "Caucasian",
      "African / Black": "African",
      "Other": "Other",
    };
    Map<String, String> orientationMap = {
      "Heterosexual / Straight": "Heterosexual",
      "Homosexual / Gay": "Homosexual",
      "Bisexual": "Bisexual",
      "Other": "Other",
    };

    body["gender"] = (genderMap[selectedGender.value] ?? selectedGender.value)!;
    body["ethnicity"] = (ethnicityMap[selectedEthnicity.value] ?? selectedEthnicity.value)!;
    body["sexual_orientation"] =
        (orientationMap[selectedOrientation.value] ?? selectedOrientation.value)!;


    body['private_fields'] = jsonEncode(privateFieldsMap);


    List<MultipartBody> multipartBody = [];
    if (profileImage.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(profileImage)));
    }

    debugPrint("Request body ===============> $body");

    try {
      final response = await ApiClient.patchMultipartData(
        ApiConstant.profileSetupEndPoint,
        body,
        multipartBody: multipartBody,
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Raw Response body: ${response.body}");

      Map<String, dynamic> responseData = {};
      if (response.body.isNotEmpty) {
        responseData = jsonDecode(response.body);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        await _dataController.setUserData(json['data'] ?? {});
        showCustomSnackBar(responseData['message'] ?? "Success", isError: false);
        Get.back();
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
      isUpdateLoading(false);
    }
  }



  /// change password

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword
  }) async {

    isChangePasswordLoading(true);

    final body = {
      "old_password": oldPassword,
      "new_password": newPassword,
      "confirm_password": confirmPassword
    };

    final response = await ApiClient.postData(ApiConstant.changePasswordEndPoint, jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {

      String message;
      if (response.body['message'] is String) {
        message = response.body['message'];
      } else {
        message = response.body['message'].toString();
      }
      showCustomSnackBar(message, isError: false);
      Get.back();
    } else {
      String message;
      if (response.body['message'] is String) {
        message = response.body['message'];
      } else {
        message = response.body['message'].toString();
      }
      showCustomSnackBar(message, isError: true);
    }

    isChangePasswordLoading(false);
  }

}