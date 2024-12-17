import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/constants/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayPicker extends StatelessWidget {
  const BirthdayPicker({
    super.key,
    required this.dateTime,
    required this.onPressed,
  });
  final DateTime dateTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(14.dg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(color: AppColors.blackColor.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Birthday (${DateTime.now().year - dateTime.year} years old)',
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              dateTime.yMMMED(),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
