import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:netwalking_global/models/category_and_subcategory_model.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/utils/image_utils.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';
import 'package:netwalking_global/views/screen/Coach/coach_view_all_users_screen.dart';

class CoachProfileSetupProfile extends GetxController{


  final isSubCategoryLoading = false.obs;
  final isSubmitLoading = false.obs;

  RxList<Category> categoryAndSubCategory = <Category>[].obs;


  Rx<File?> coachImageFile = Rx<File?>(null);

  Future<void> pickCoachImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      coachImageFile.value = pickedFile;
    }

  }


  Future<void> fetchCategoryAndSubCategory() async {
    isSubCategoryLoading(true);

    final response = await ApiClient.getData(ApiConstant.coachCategoriesEndPoint);
    if(response.statusCode == 200){
      final data = CategoryAndSubCategoryModel.fromJson(response.body);
      categoryAndSubCategory.assignAll(data.data);
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isSubCategoryLoading(false);

  }


  Future<void> setupCoachProfile({
    required String profileImagePath,
    required String fullName,
    required String age,
    required String location,
    required String bio,
    required List<int> coachingAreas,
    required List<int> subCoachingAreas,
    required List<String> certifications,
    required List<String> languages,
    required String sessionFormat,
    String? personalWebsite,
    String? linkedInProfile,
    required Map<String, List<Map<String, String>>> availability,
    required String pricePerSession,
    required bool neurodiversityAffirming,
    required bool genderSensitive,
    required bool traumaSensitive,
    required bool faithBased,
})async{

    isSubmitLoading(true);

    List<MultipartBody> multipartBody = [];
    if (profileImagePath.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(profileImagePath)));
    }

    final Map<String, String> body = {
      "full_name": fullName,
      "age": age,
      "location": location,
      "bio": bio,
      "certifications": jsonEncode(certifications),
      "languages_spoken": jsonEncode(languages),
      "session_format": sessionFormat.toLowerCase() == "in-person" ? "in-person" : "virtual",
      "availability": jsonEncode(availability),
      "price_per_session": pricePerSession,
      "neurodiversity_affirming": neurodiversityAffirming.toString(),
      "gender_sensitive": genderSensitive.toString(),
      "trauma_sensitive": traumaSensitive.toString(),
      "faith_based": faithBased.toString(),
    };

    if (personalWebsite?.isNotEmpty ?? false) {
      body['personal_website'] = personalWebsite!;
    }
    if (linkedInProfile?.isNotEmpty ?? false) {
      body['linkedin_profile'] = linkedInProfile!;
    }


    for (final id in coachingAreas) {
      body['coaching_areas[]'] = id.toString();
    }


    for (final id in subCoachingAreas) {
      body['sub_coaching_areas[]'] = id.toString();
    }

    final response =
    await ApiClient.patchMultipartData(ApiConstant.profileSetupEndPoint, {"data":jsonEncode(body)},
        multipartBody: multipartBody);

    Map<String, dynamic> responseData = {};
    if (response.body.isNotEmpty) {
      responseData = jsonDecode(response.body);
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(responseData['message'] ?? "Success", isError: false);
      Get.to(()=> CoachViewAllUsersScreen());
    } else {
      showCustomSnackBar(responseData['message'], isError: true);
    }

    isSubmitLoading(false);

  }


}