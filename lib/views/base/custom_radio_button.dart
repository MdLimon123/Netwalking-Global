import 'package:flutter/material.dart';
import 'package:netwalking_global/utils/app_colors.dart';

class CustomRadioButton extends StatelessWidget {

  final bool value;
  final void Function(bool) onChanged;

  const CustomRadioButton({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
       onChanged(!value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? AppColors.primaryColor : null,
          border: Border.all(color: const Color(0xFF8EB2D8), width: 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: const Color(0xFF12110D).withValues(alpha: 0.12),
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: value ? 1.0 : 0.0,
            curve: Curves.easeInOutBack,
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      )
      ,
    );
  }
}
