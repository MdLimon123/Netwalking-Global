import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/utils/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Text(title,style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
        ),),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: Color(0xFF0D1C12),
            size: 18,),
        ),
      actions: [
        SvgPicture.asset('assets/icons/notification.svg'),
        SizedBox(width: 10,)
      ],
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}