import 'package:get/get.dart';
import 'package:netwalking_global/models/find_booking_coach_model.dart';
import 'package:netwalking_global/services/api_checker.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';

class FindBookCoachController extends GetxController{

  final isFindCoachLoading = false.obs;

  RxList<FindBookingCoach> findBookingCoachList = <FindBookingCoach>[].obs;


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


}