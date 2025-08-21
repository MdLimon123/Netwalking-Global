import 'package:flutter/material.dart';
import 'package:netwalking_global/views/base/custom_button.dart';

class JointBookACoachScreen extends StatefulWidget {
  const JointBookACoachScreen({super.key});

  @override
  State<JointBookACoachScreen> createState() => _JointBookACoachScreenState();
}

class _JointBookACoachScreenState extends State<JointBookACoachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(onTap: (){}, text: 'Start Now'),
            SizedBox(height: 116,),
            CustomButton(onTap: (){}, text: "Mark as Completed"),
            SizedBox(height: 22,),
            CustomButton(onTap: (){}, text: "Delete ")
          ],
        ),
      ),
    );
  }
}
