import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_onboarding/ui/utils/theme/app_colors.dart';
import 'package:news_onboarding/ui/utils/theme/tex_styles.dart';

class CommonDomainBottomMessage extends StatefulWidget {
  const CommonDomainBottomMessage({super.key});

  @override
  State<CommonDomainBottomMessage> createState() => _CommonDomainBottomMessageState();
}

class _CommonDomainBottomMessageState extends State<CommonDomainBottomMessage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: AppColors.appColor,
        child: Text(
          "Select as many \n as you like",
          textAlign: TextAlign.center,
          style: TextStyles.regular.copyWith(fontFamily: TextStyles.fontFamily,color: AppColors.red,fontSize: 16.sp),
        ),
      ),
    );
  }
}
