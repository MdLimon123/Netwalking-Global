import 'dart:convert';

import 'package:get/get.dart';
import 'package:netwalking_global/models/best_suggest_match_model.dart';
import 'package:netwalking_global/services/api_checker.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';

class HomeController extends GetxController{

  RxList<BestSuggestMatchModel> bestSuggestMatchList = <BestSuggestMatchModel>[].obs;

  final isSuggestedLoading = false.obs;

  final isInvitationLoading = false.obs;


  Future<void> fetchBestSuggestMatch()async{

    isSuggestedLoading(true);

    final response = await ApiClient.getData(ApiConstant.bestSuggestedMatchEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      List<dynamic> data = response.body['data'];
      bestSuggestMatchList.value = data
          .map((e) => BestSuggestMatchModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isSuggestedLoading(false);
  }

  Future<void> sendInvitation({required int id,
    required String walkingAvailability,
  required String wakingDistance,
  required String paceSelection,
  required String sessionDate})async{

    isInvitationLoading(true);
    final body = {
      "invited_user_id": id,
      "walking_availability": walkingAvailability,
      "waking_distance": wakingDistance,
      "pace_selection": paceSelection,
      "session_date": sessionDate
    };

    final response = await ApiClient.postData(ApiConstant.sendInvitationEndPoint, jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar("Invitation sent successfully", isError: false);
    }else{
      ApiChecker.checkApi(response);
    }
    isInvitationLoading(false);

  }
}