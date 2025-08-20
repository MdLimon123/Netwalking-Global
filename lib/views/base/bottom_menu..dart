
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/helpers/route.dart';
import 'package:netwalking_global/utils/app_icons.dart';




class BottomMenu extends StatelessWidget {
  final int menuIndex;

  const BottomMenu(this.menuIndex, {super.key});

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    final bool isSelected = index == menuIndex;

    return BottomNavigationBarItem(
      label: "",
      icon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 20),
        decoration: isSelected
            ? BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0048FF),
              Color(0xFF00B2FF)],
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
          topRight: Radius.circular(4),
          bottomRight: Radius.circular(4)),
        )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              height: 20,
              width: 20,
              color: isSelected ? Colors.white : theme.disabledColor,
            ),
            if (isSelected) ...[
              const SizedBox(width:4),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(AppIcons.homeIcon, 'Home', theme, 0),
      getItem(AppIcons.communityIcon, 'Community', theme, 1),
      getItem(AppIcons.messageIcon, 'Message', theme, 2),
      getItem(AppIcons.profileIcon, 'Profile', theme, 3),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedFontSize: 0, // 🚫 Prevent default label
          unselectedFontSize: 0,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                Get.offAndToNamed(AppRoutes.homeScreen);
                break;
              case 1:
                Get.offAndToNamed(AppRoutes.communityScreen);
                break;
              case 2:
                Get.offAndToNamed(AppRoutes.inboxScreen);
                break;
              case 3:
                Get.offAndToNamed(AppRoutes.profileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}
