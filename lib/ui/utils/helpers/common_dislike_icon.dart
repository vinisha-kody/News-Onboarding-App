import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDislikeIcon extends StatefulWidget {
  const CommonDislikeIcon({super.key});

  @override
  State<CommonDislikeIcon> createState() => _CommonDislikeIconState();
}

class _CommonDislikeIconState extends State<CommonDislikeIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.thumb_down_outlined,color: const Color(0xffFE4B4B),size: 33.w,);
  }
}