import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class DisabilityAccessibilityScreen extends StatefulWidget {
  const DisabilityAccessibilityScreen({super.key});

  @override
  State<DisabilityAccessibilityScreen> createState() => _DisabilityAccessibilityScreenState();
}

class _DisabilityAccessibilityScreenState extends State<DisabilityAccessibilityScreen> {

  bool _isChecked = false;
  bool _isYesChecked  = false;
  
  final selfDescribeController = TextEditingController();


  List<String> checkItem = [
    "Neurotypical",
    "ADHD",
    "Dyslexic",
    "SPD",
    "Tourette’s",
    "Dysgraphic",
    "Hyperlexic"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              width: double.infinity,
              color: Color(0xFFE6EEF7),
              child: Column(
                children: [
                  Text("2 Of 3",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 16
                  ),),
                  SizedBox(height: 20,),
                  SvgPicture.asset('assets/icons/accessibility.svg'),
                  SizedBox(height: 20,),
                  Text("Disability & Accessibility (Optional)",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    fontSize: 14
                  ),),
                  SizedBox(height: 8,),
                  Center(
                    child: Text("Do you have any accessibility requirements?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      fontSize: 24
                    ),
                    textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFE6EEF7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor
                      ),
                    ),

                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      activeColor: Color(0xFF30D143),
                      checkColor: Colors.white,
                    ),


                  ]),
                ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6EEF7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500
                            ),
                          ),

                          Checkbox(
                            value: _isYesChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isYesChecked = value!;
                              });
                            },
                            activeColor: Color(0xFF30D143),
                            checkColor: Colors.white,
                          ),


                        ]),
                  ),
                  SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFE6EEF7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/right.svg'),
                        SizedBox(width: 12,),
                        Text("Self- describe",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    CustomTextField(controller: selfDescribeController,
                      hintText: 'Write here',
                      maxLines: 4,
                      filColor: Color(0xFFFFFFFF),)
                  ],
                ),
              ),
                  SizedBox(height: 20,),

                  CustomDropdownCheckbox(
                      title: "Select Disability",
                      showCheckbox: true,
                      options: checkItem,
                      showLeadingIcon: false,
                      onChanged: (val){

                      }),

                  SizedBox(height: 92,),
                  CustomButton(onTap: (){},
                      text: 'Continue')


             ] ),
            )
          ],
        ),
      ),
    );
  }


}
