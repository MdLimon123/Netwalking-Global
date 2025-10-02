import 'package:get/get.dart';
import 'package:netwalking_global/models/find_partner_search_model.dart';
import 'package:netwalking_global/models/find_partner_walk_model.dart';
import 'package:netwalking_global/services/api_checker.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';

class FindPartnerWalkController extends GetxController{


  final isFindPatnerWalkLoading = false.obs;
  final isSearchForPartnerWalkLoading = false.obs;

  RxList<FindPartnerWalkData> findPartnerWalkList = <FindPartnerWalkData>[].obs;
  RxList<FindPartnerSearchData> searchForPartnerWalkList = <FindPartnerSearchData>[].obs;
  RxString selectedAvailability = "".obs;
  RxString selectedDistance = "".obs;
  RxString selectedCost = "".obs;
  RxString selectedType = "".obs;


  /// find partner walk
  Future<void> fetchFindPartnerWalk() async {

    isFindPatnerWalkLoading(true);

    final response = await ApiClient.getData(ApiConstant.findPartnerWalkEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      findPartnerWalkList.value = data.map((e) => FindPartnerWalkData.fromJson(e)).toList();
    }else{
      isFindPatnerWalkLoading(false);
    }
    isFindPatnerWalkLoading(false);
  }

  /// find partner walk serach

 Future<void> fetchSearchForPartnerWalk() async {
    isSearchForPartnerWalkLoading(true);
    final query = {
      if (selectedAvailability.value.isNotEmpty)
        "walking_availability": selectedAvailability.value,
      if (selectedDistance.value.isNotEmpty)
        "waking_distance": selectedDistance.value,
      if (selectedCost.value.isNotEmpty)
        "cost": selectedCost.value,
      if (selectedType.value.isNotEmpty)
        "type": selectedType.value,
    };

    final response = await ApiClient.getData(ApiConstant.searchForPartnerWalkEndPoint, query: query);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      searchForPartnerWalkList.value = data.map((e) => FindPartnerSearchData.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isSearchForPartnerWalkLoading(false);



 }

}