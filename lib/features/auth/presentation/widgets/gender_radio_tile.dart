import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderRadioTile extends StatelessWidget {
  const GenderRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });
  final String title;
  final String value;
  final String? selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        Radio.adaptive(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
