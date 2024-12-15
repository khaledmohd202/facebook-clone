import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.onPressed,
    required this.label,
    this.color = AppColors.lightBlueColor,
    this.height = 50,
  });

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.darkBlueColor),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (color == AppColors.lightBlueColor && onPressed != null)
                  ? AppColors.realWhiteColor
                  : AppColors.darkBlueColor,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
