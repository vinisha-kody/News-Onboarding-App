import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';

class CommonTextField extends StatelessWidget {
  final String? message;
  const CommonTextField({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message!,
      textAlign: TextAlign.center,
      style: TextStyles.bold.copyWith(
        fontFamily: TextStyles.fontFamily,
        fontSize: 48.sp,
        color: AppColors.white,
      ),
    );
  }
}
