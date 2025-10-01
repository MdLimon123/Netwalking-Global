import 'dart:convert';

import 'package:get/get.dart';
import 'package:netwalking_global/models/all_category_model.dart';
import 'package:netwalking_global/models/coach_filter_model.dart';
import 'package:netwalking_global/models/coach_profile_model.dart';
import 'package:netwalking_global/models/find_booking_coach_model.dart';
import 'package:netwalking_global/models/session_booking_model.dart';
import 'package:netwalking_global/services/api_checker.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

class FindBookCoachController extends GetxController{

  final isFindCoachLoading = false.obs;
  final isAllCategoryLoading = false.obs;
  final isCoachFilterLoading = false.obs;
  final isCoachProfileLoading = false.obs;
  final isCoachBookingLoading = false.obs;
  final sessionBookingDataLoading = false.obs;

  RxList<FindBookingCoach> findBookingCoachList = <FindBookingCoach>[].obs;
  RxList<AllCategory> allCategoryList = <AllCategory>[].obs;

  RxList<CoachFilterData> coachFilterList = <CoachFilterData>[].obs;
  Rx<CoachProfileModel?> coachProfile = Rx<CoachProfileModel?>(null);

  final RxList<SessionBookingData> sessionBookingData = <SessionBookingData>[].obs;



  RxString selectedGender = "".obs;
  RxString selectedLanguage = "".obs;
  Rx<AllCategory?> selectedCategory = Rx<AllCategory?>(null);
  RxString selectedFormat = "".obs;
  RxString selectedLevel = "".obs;
  RxString selectedAvailability = "".obs;

  List<String> gender = [
    "Man",
    "Women",
    "Non-binary",
    "Prefer not to say",
    "Self-describe"
  ];

  List<String> language = [
    "English",
    "Bangla",
    "Hindi",
    "Spanish"
  ];

  List<String> coachFocus = [
    "Mental Health & Wellbeing",
    "Professional Growth",
    "Networking Support",
    "Life Transitions",
    "Inclusion & Accessibility",
    "Purpose & Values",
    "Movement-Based Coaching"
  ];

  List<String> preferredCoach =[
    "in-person",
    "virtual",
  ];

  List<String> coachLevel = [
    "Beginner",
    "Intermediate",
    "Expert",
    "Certified / Accredited"
  ];

  List<String> coachAvailability = [
    "Morning",
    "Afternoon",
    "Evening"
  ];


  /// find all coach
  Future<void> fetchFindBookingCoach() async {

    isFindCoachLoading(true);

    final response = await ApiClient.getData(ApiConstant.findBookingCoachEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      findBookingCoachList.value = data.map((e) => FindBookingCoach.fromJson(e)).toList();

    }else{
      ApiChecker.checkApi(response);
    }
    isFindCoachLoading(false);

  }

  /// get all category
Future<void> fetchAllCategory() async {

    isAllCategoryLoading(true);

  final response = await ApiClient.getData(ApiConstant.allCategoryEndPoint);
  if(response.statusCode == 200) {
    List<dynamic> data = response.body['data'];
    allCategoryList.value = data.map((e) => AllCategory.fromJson(e)).toList();
  }else{
    ApiChecker.checkApi(response);
  }
  isAllCategoryLoading(false);

}

/// coach filter
 Future<void> fetchCoachFilter() async {

    isCoachFilterLoading(true);

    final query = {
      if (selectedFormat.value.isNotEmpty)
        "session_format": selectedFormat.value,
      if (selectedLanguage.value.isNotEmpty)
        "languages_spoken": selectedLanguage.value.toLowerCase(),
      if (selectedCategory.value != null)
        "coaching_areas": selectedCategory.value!.id.toString(),
      if (selectedAvailability.value.isNotEmpty)
        "walking_availability": selectedAvailability.value,
    };
    
    final response = await ApiClient.getData(ApiConstant.coachFilterEndPoint, query: query);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      coachFilterList.value = data.map((e) => CoachFilterData.fromJson(e)).toList();
      print(coachFilterList);
    }else{
      ApiChecker.checkApi(response);
    }
    isCoachFilterLoading(false);

 }

 /// coach profile

Future<void> fetchCoachProfile({required int id}) async {
    isCoachProfileLoading(true);
    final response = await ApiClient.getData(ApiConstant.coachProfileEndPoint(id: id));
    if(response.statusCode == 200){
      coachProfile.value = CoachProfileModel.fromJson(response.body['user']);

    }else{
      ApiChecker.checkApi(response);
    }
    isCoachProfileLoading(false);

}

/// coach booking

 Future<void> coachBooking({required int coachId, required int coachingArea, required String date, required String time, required String sessionFormat, required double price,}) async {

    isCoachBookingLoading(true);
    final body = {
      "coach": coachId,
      "coaching_area": coachingArea,
      "session_date": date,
      "session_time": time,
      "session_format": sessionFormat,
      "price": price,

    };
    final response = await ApiClient.postData(ApiConstant.coachBookingEndPoint,  jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar('Booking Successful', isError: false);
      print(response.body);
    }else{
      ApiChecker.checkApi(response);
    }
    isCoachBookingLoading(false);

 }

 Future<void> fetchSessionBookingDetails({required int id}) async {
    sessionBookingDataLoading(true);
    final response = await ApiClient.getData(ApiConstant.sessionDetailsEndPoint(id: id));
    if(response.statusCode == 200){
      final List<dynamic> jsonList = response.body['data'];
      sessionBookingData.value = jsonList.map((e) => SessionBookingData.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    sessionBookingDataLoading(false);
 }

}
