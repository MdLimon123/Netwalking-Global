import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/helpers/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
    
      Get.offNamed(AppRoutes.onboradingScreen);
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
