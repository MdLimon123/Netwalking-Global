import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/screen/Home/AllSubScreen/JointEvent/emergency_call_screen.dart';

class LiveTrackScreen extends StatefulWidget {
  const LiveTrackScreen({super.key});

  @override
  State<LiveTrackScreen> createState() => _LiveTrackScreenState();
}

class _LiveTrackScreenState extends State<LiveTrackScreen> {

  late GoogleMapController mapController;
  LatLng _center = LatLng(37.7749, -122.4194);

  double progress = 50.0;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _simulateProgress();
    super.initState();
  }

  void _simulateProgress() {
    Future.delayed(Duration(seconds: 1), () {
      if (progress < 1.0) {
        setState(() {
          progress += 0.1;  // Simulate progress
        });
        _simulateProgress();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Live Track'),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 14,
                  ),
                  mapType: MapType.normal,
                ),
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: Container(
                    width: 110,
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Navigate",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                        ),),
                        SvgPicture.asset('assets/icons/navigate.svg')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text("Badge Progress",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F171A)
                        ),),
                      ),
                      SizedBox(height: 12,),
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: 10.0,
                        borderRadius: BorderRadius.circular(8),
                        backgroundColor: Color(0xFFD4DEE3),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF0957AA)),
                      ),
                      SizedBox(height: 12,),
                      Center(
                        child: Text("+20 XP for 5-minute walk",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                        ),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE8F0F2),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Text("00",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0F171A)
                                      ),),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text("Hours",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF0F171A)
                                  ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 16,),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE8F0F2),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Text("12",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0F171A)
                                      ),),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text("Minutes",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF0F171A)
                                  ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 16,),
                           Expanded(
                             child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE8F0F2),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Text("34",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0F171A)
                                      ),),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text("Seconds",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF0F171A)
                                  ),)
                              ],
                                                       ),
                           )
                        ],
                      ),
                      SizedBox(height: 16,),
                      Center(
                        child: Container(
                          width: 30,
                          height: 11,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF0F8A98),
                                Color(0xFF00B35F)
                              ]
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8F0F2),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: SvgPicture.asset('assets/icons/save.svg')
                          ),
                          SizedBox(width: 16,),
                          Text("Safe Walking Guidelines",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0F171A)
                          ),)

                        ],
                      )
                    ],
                  )
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(onTap: (){},
                          text: "Finish Event"),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=> EmergencyCallScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFD72323),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/phone.svg'),
                              SizedBox(width: 16,),
                              Text("Emergency",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFAFAFA)
                              ),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
