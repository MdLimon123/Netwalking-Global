import 'package:get/get.dart';
import 'package:netwalking_global/models/about_us_model.dart';
import 'package:netwalking_global/models/privacy_police_model.dart';
import 'package:netwalking_global/models/terms_and_service_model.dart';
import 'package:netwalking_global/services/api_checker.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';

class AboutUsController extends GetxController{

  final isTermsServiceLoading = false.obs;

  final isAboutUsLoading = false.obs;

  final isPrivacyPoliceLoading = false.obs;
  
  
  RxList<TermsServiceModel> termsServiceList = <TermsServiceModel>[].obs;
  RxList<AboutUsModel> aboutUsList = <AboutUsModel>[].obs;
  RxList<PrivacyPoliceModel> privacyPoliceList = <PrivacyPoliceModel>[].obs;
  
  
  Future<void> fetchTermsService()async{
    
    isTermsServiceLoading(true);
    
    final response = await ApiClient.getData(ApiConstant.termsOfServiceEndPoint);
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
      termsServiceList.value = data.map((item) => TermsServiceModel.fromJson(item)).toList();

    }else{
      ApiChecker.checkApi(response);
    }
    isTermsServiceLoading(false);
    
  }

  Future<void> fetchAboutUs()async{

    isAboutUsLoading(true);

    final response = await ApiClient.getData(ApiConstant.aboutUsEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      aboutUsList.value = data.map((item) => AboutUsModel.fromJson(item)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isAboutUsLoading(false);


  }

  Future<void> fetchPrivacyPolice()async{

    isPrivacyPoliceLoading(true);

    final response = await ApiClient.getData(ApiConstant.privacyPoliceEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      privacyPoliceList.value = data.map((item) => PrivacyPoliceModel.fromJson(item)).toList();
    }else{
      ApiChecker.checkApi(response);

    }
    isPrivacyPoliceLoading(false);

  }

}