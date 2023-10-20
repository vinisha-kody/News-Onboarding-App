import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonLikeIcon extends StatefulWidget {
  const CommonLikeIcon({super.key});

  @override
  State<CommonLikeIcon> createState() => _CommonLikeIconState();
}

class _CommonLikeIconState extends State<CommonLikeIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.thumb_up_outlined,color: Colors.white,size: 33.w,);
  }
}
