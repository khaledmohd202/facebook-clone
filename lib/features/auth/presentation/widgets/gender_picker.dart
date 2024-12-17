import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/constants/constants.dart';
import 'package:facebook_clone/features/auth/presentation/widgets/gender_radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker(
      {super.key, required this.gender, required this.onChanged});
  final String? gender;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          GenderRadioTile(
            title: 'Male',
            value: 'male',
            selectedValue: gender,
            onChanged: onChanged,
          ),
          GenderRadioTile(
            title: 'Female',
            value: 'fe male',
            selectedValue: gender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
