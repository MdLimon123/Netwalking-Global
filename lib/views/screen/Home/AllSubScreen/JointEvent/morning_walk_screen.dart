import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/live_track_screen.dart';

class MorningWalkScreen extends StatefulWidget {
  const MorningWalkScreen({super.key});

  @override
  _MorningWalkScreenState createState() => _MorningWalkScreenState();
}

class _MorningWalkScreenState extends State<MorningWalkScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {


        Get.to(()=> LiveTrackScreen());

      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Morning Walk"),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: CircularProgressIndicator(
                    value: _controller.value,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF094EBE)),
                  ),
                ),
                Text(
                  "Track Now",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                  ),
                )
              ],
            );
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}