import 'dart:io';

import 'package:facebook_clone/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, required this.image});
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3.w,
        ),
      ),
      child: Stack(
        children: [
          image != null
              ? CircleAvatar(
                  radius: 50.r,
                  backgroundImage: FileImage(image!),
                )
              : CircleAvatar(
                  radius: 50.r,
                  backgroundImage: const NetworkImage(Constants.maleProfilePic),
                ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
