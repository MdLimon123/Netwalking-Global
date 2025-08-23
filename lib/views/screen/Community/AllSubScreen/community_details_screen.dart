import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class CommunityDetailsScreen extends StatefulWidget {
  const CommunityDetailsScreen({super.key});

  @override
  State<CommunityDetailsScreen> createState() => _CommunityDetailsScreenState();
}

class _CommunityDetailsScreenState extends State<CommunityDetailsScreen> {

  final  sendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Community Details"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Text(
                "Post Details",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),


            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/image/profile.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("2 hours ago",
                                  style: TextStyle(
                                      color: Color(0xFF545454),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 4),
                              Text("Mr.John",
                                  style: TextStyle(
                                      color: Color(0xFF545454),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text("Clean Up Walk",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      SizedBox(height: 8),
                      Text(
                        "Navigating the complexities of a long-distance relationship can be challenging...",
                        style: TextStyle(
                            color: Color(0xFF545454),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 154,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/dummy.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 4),
                          Text("25",
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(width: 15),
                          SvgPicture.asset('assets/icons/comment.svg'),
                          SizedBox(width: 4),
                          Text("25",
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text("Comment",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('assets/image/profile.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xFFEFF9EE),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("14 min ago",
                                            style: TextStyle(
                                                color: Color(0xFF545454),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(height: 4),
                                        Text("Mr.John",
                                            style: TextStyle(
                                                color: AppColors.textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(height: 8),
                                        Text(
                                          "That's a fantastic new app feature...",
                                          style: TextStyle(
                                              color: Color(0xFF272727),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (__, index) => SizedBox(height: 16),
                          itemCount: 4)
                    ],
                  ),
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: sendController,
                      hintText: "Send a message",
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 35,
                    width: 72,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF094EBE), Color(0xFF15AABA)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )

    );
  }
}
