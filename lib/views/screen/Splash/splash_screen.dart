import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/services/prefs_helper.dart';
import 'package:netwalking_global/utils/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _dataController = Get.put(DataController());

@override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async{

      print("All Data ==========> ${_dataController.getUserData()}");

      var token = await PrefsHelper.getString(AppConstants.bearerToken);
      print("token =============> ${token}");
      if(token.isNotEmpty){
        Get.offAllNamed(AppRoutes.homeScreen);
      }else{
        Get.offNamed(AppRoutes.onboradingScreen);
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/image/splashIcon.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              'Netwalking Global',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
