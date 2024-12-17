// pick image method
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<File?> pickImage() async {
  File? image;
  final picker = ImagePicker();
  final file = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 720.h,
    maxWidth: 720.w,
  );

  if (file != null) {
    image = File(file.path);
  }

  return image;
}

Future<File?> pickVideo() async {
  File? video;
  final picker = ImagePicker();
  final file = await picker.pickVideo(
    source: ImageSource.gallery,
    maxDuration: const Duration(minutes: 5),
  );

  if (file != null) {
    video = File(file.path);
  }
  return video;
}

// show toast Message
void showToastMessage({
  required String text,
}) {
  Fluttertoast.showToast(
    msg: text,
    backgroundColor: Colors.black54,
    fontSize: 18.sp,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
