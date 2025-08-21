import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class CoachProfileDetailsScreen extends StatefulWidget {
  const CoachProfileDetailsScreen({super.key});

  @override
  State<CoachProfileDetailsScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Coach Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/image/profile.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Maria Hernandez",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("Certified Career Coach by ICF",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    // Row(
                    //   children: [
                    //     RatingBar.builder(
                    //       initialRating: 3,
                    //       minRating: 1,
                    //       direction: Axis.horizontal,
                    //       allowHalfRating: true,
                    //       itemSize: 14,
                    //       itemCount: 5,
                    //       itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    //       itemBuilder: (context, _) => Icon(
                    //         Icons.star,
                    //         color: Color(0xFF00428A),
                    //         size: 12,
                    //       ),
                    //       onRatingUpdate: (rating) {},
                    //     ),
                    //     SizedBox(width: 4),
                    //     Text("coachProfile.rating".tr,
                    //         style: TextStyle(
                    //           color: AppColors.bigTextColor,
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.w400,
                    //         ))
                    //   ],
                    // )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            _buildRow(
                image: 'assets/icons/location.svg',
                text: 'From New York, USA'),
            SizedBox(height: 8),
            _buildRow(
                image: 'assets/icons/global.svg',
                text: 'Languages: English, Spanish'),
            SizedBox(height: 8),
            _buildRow(
                image: 'assets/icons/computer.svg',
                text: 'Coaching Format: Virtual'),
            SizedBox(height: 20),
            Text("About Coach",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 8),
            Text("With over 10 years of experience, Coach Maria specializes in helping clients transition into new careers, refine their professional skills, and achieve their career goals",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 20),
            Text("Special Considerations",style: TextStyle(
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
            SizedBox(height: 8),

            Row(
              children: [
                Text("Neurodiversity Affirming:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("LGBTQIA+ Affirming:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Gender Sensitive:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Trauma Sensitive:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/close_fill.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Faith-Based Approach:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 20,),
            

            Text("Website and Social Links",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                    color: Color(0xFF4B5563)),
                SizedBox(width: 8),
                Text("www.website.com",
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                    color: Color(0xFF4B5563)),
                SizedBox(width: 8),
                Text("www.linkedin.com/in/maria.hernandez",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                    color: Color(0xFF4B5563)),
                SizedBox(width: 8),
                Text("instagram.com/maria.hernandez",
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(height: 20),
            Text("Availability",
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("19 July, 2025",
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                      SvgPicture.asset('assets/icons/calender.svg')
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color(0xFF3368A1), width: 0.5)),
                          child: Text("9:00 AM-10:00 AM",
                              style: TextStyle(
                                color: Color(0xFF3368A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color(0xFF3368A1), width: 0.5)),
                          child: Text("11:00 AM-12:00 PM",
                              style: TextStyle(
                                color: Color(0xFF3368A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color(0xFF3368A1), width: 0.5)),
                          child: Text("12:00 PM-1:00 PM",
                              style: TextStyle(
                                color: Color(0xFF3368A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color(0xFF3368A1), width: 0.5)),
                          child: Text("4:00 PM-5:00 PM",
                              style: TextStyle(
                                color: Color(0xFF3368A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Pricing:',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                Text('\$500 per session',
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
            SizedBox(height: 32),
            CustomButton(
                onTap: () {

                },
                text: 'Confirm Booking')
          ],
        ),
      ),

    );
  }

  _buildRow({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 4),
        Text(text,
            style: TextStyle(
                color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ))
      ],
    );
  }

  _customContainer({required String image, required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF5480B1), width: 0.8),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1D4760).withOpacity(0.018),
                blurRadius: 2.2,
                offset: Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
